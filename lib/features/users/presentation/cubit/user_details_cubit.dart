// features/users/presentation/cubit/user_details_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:connects_app/core/networking/api_result.dart';
import 'package:connects_app/features/users/domain/entities/user_entity.dart';
import 'package:connects_app/features/users/domain/usecases/get_user_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_details_cubit.freezed.dart';
part 'user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  UserDetailsCubit(this._getUser) : super(const UserDetailsState.loading());

  final GetUserDetails _getUser;

  // Load user details by id
  Future<void> load(int id) async {
    emit(const UserDetailsState.loading()); // show loader
    final res = await _getUser(id);
    res.when(
      success: (user) => emit(UserDetailsState.loaded(user)),
      failure: (err) => emit(
        UserDetailsState.error(err.apiErrorModel.error ?? 'Unknown error'),
      ),
    );
  }
}
