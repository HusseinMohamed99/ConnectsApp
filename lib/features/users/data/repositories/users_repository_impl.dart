import 'package:connects_app/core/networking/api_error_handler.dart';
import 'package:connects_app/core/networking/api_result.dart';
import 'package:connects_app/core/networking/api_service.dart';
import 'package:connects_app/features/users/data/mappers/user_mapper.dart';
import 'package:connects_app/features/users/data/models/single_user_response.dart';
import 'package:connects_app/features/users/data/models/users_list_response.dart';
import 'package:connects_app/features/users/domain/entities/user_entity.dart';
import 'package:connects_app/features/users/domain/entities/users_page_entity.dart';
import 'package:connects_app/features/users/domain/repositories/users_repository.dart';
import 'package:dio/dio.dart';

class UsersRepositoryImpl implements UsersRepository {
  UsersRepositoryImpl(this._api);
  final ApiService _api;

  static const String _lang = 'en';

  @override
  Future<ApiResult<UsersPageEntity>> getUsersPage(int page) async {
    try {
      final UsersListResponse res = await _api.getAllUsers(page);

      final items = (res.data ?? []).map((m) => m.toEntity()).toList();
      final usersPage = UsersPageEntity(
        page: res.page ?? 1,
        totalPages: res.totalPages ?? 1,
        data: items,
      );

      return ApiResult.success(usersPage);
    } on DioException catch (e) {
      return ErrorHandler.asFailure<UsersPageEntity>(e, _lang);
    } catch (e) {
      return ErrorHandler.asFailure<UsersPageEntity>(e, _lang);
    }
  }

  @override
  Future<ApiResult<UserEntity>> getUser(int id) async {
    try {
      final SingleUserResponse res = await _api.getSingleUser(id);
      final userModel = res.data;

      if (userModel == null) {
        return ErrorHandler.asFailure<UserEntity>('User not found', _lang);
      }

      return ApiResult.success(userModel.toEntity());
    } on DioException catch (e) {
      return ErrorHandler.asFailure<UserEntity>(e, _lang);
    } catch (e) {
      return ErrorHandler.asFailure<UserEntity>(e, _lang);
    }
  }
}
