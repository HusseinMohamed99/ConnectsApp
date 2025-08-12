import 'package:bloc/bloc.dart';
import 'package:connects_app/core/networking/api_result.dart';
import 'package:connects_app/features/users/domain/entities/user_entity.dart';
import 'package:connects_app/features/users/domain/entities/users_page_entity.dart';
import 'package:connects_app/features/users/domain/usecases/get_user_details.dart';
import 'package:connects_app/features/users/domain/usecases/get_users_page.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_cubit.freezed.dart';
part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit({required this.getUsersPageUseCase, required this.getUserUseCase})
    : super(const UsersState.initial()) {
    // Register scroll listener for infinite scroll
    scrollController.addListener(_onScroll);
  }

  final GetUsersPage getUsersPageUseCase;
  final GetUserDetails getUserUseCase;

  // Expose a single ScrollController owned by the Cubit
  final ScrollController scrollController = ScrollController();
  bool get hasMore => _hasMore;

  // Local pagination bookkeeping
  int _currentPage = 0;
  int _totalPages = 1;
  bool _hasMore = true;
  bool _isLoadingMore = false;

  // Accumulated cache for list items across pages
  final List<UserEntity> _usersCache = [];

  /// Load a specific page (used for first page and explicit loads)
  Future<void> loadUsersPage(int page) async {
    // When loading the first page, show full-screen loader
    final isFirstPage = page == 1;
    if (isFirstPage) {
      emit(const UsersState.loading());
      // Reset pagination state
      _usersCache.clear();
      _currentPage = 0;
      _totalPages = 1;
      _hasMore = true;
      _isLoadingMore = false;
    }

    final result = await getUsersPageUseCase(page);
    result.when(
      success: (data) {
        // Update pagination info
        _currentPage = data.page;
        _totalPages = data.totalPages;
        _hasMore = _currentPage < _totalPages;

        // Append new items to cache
        _usersCache.addAll(data.data);

        // Emit merged page entity (no copyWith needed)
        emit(
          UsersState.usersPageLoaded(
            UsersPageEntity(
              page: _currentPage,
              totalPages: _totalPages,
              data: List.unmodifiable(_usersCache),
            ),
          ),
        );
      },
      failure: (error) =>
          emit(UsersState.error(error.apiErrorModel.error ?? 'Unknown error')),
    );
  }

  /// Load the next page when reaching list end
  Future<void> loadMoreUsers() async {
    // Guard against parallel loads or when no more pages left
    if (_isLoadingMore || !_hasMore) return;

    _isLoadingMore = true;
    final nextPage = _currentPage + 1;

    final result = await getUsersPageUseCase(nextPage);
    result.when(
      success: (data) {
        _currentPage = data.page;
        _totalPages = data.totalPages;
        _hasMore = _currentPage < _totalPages;

        // Append to cache, then emit a merged snapshot
        _usersCache.addAll(data.data);

        emit(
          UsersState.usersPageLoaded(
            UsersPageEntity(
              page: _currentPage,
              totalPages: _totalPages,
              data: List.unmodifiable(_usersCache),
            ),
          ),
        );
      },
      failure: (error) =>
          emit(UsersState.error(error.apiErrorModel.error ?? 'Unknown error')),
    );

    _isLoadingMore = false;
  }

  /// Pull-to-refresh helper (reload from page 1)
  Future<void> refresh() => loadUsersPage(1);

  /// Fetch a single user (for details)
  Future<void> loadUser(int id) async {
    emit(const UsersState.loading());
    final result = await getUserUseCase(id);
    result.when(
      success: (data) => emit(UsersState.userLoaded(data)),
      failure: (error) =>
          emit(UsersState.error(error.apiErrorModel.error ?? 'Unknown error')),
    );
  }

  // Infinite scroll trigger
  void _onScroll() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 200) {
      loadMoreUsers();
    }
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }
}
