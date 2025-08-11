part of 'users_cubit.dart';

@freezed
class UsersState with _$UsersState {
  const factory UsersState.initial() = _Initial;
  const factory UsersState.loading() = _Loading;
  const factory UsersState.usersPageLoaded(UsersPageEntity usersPage) =
      _UsersPageLoaded;
  const factory UsersState.userLoaded(UserEntity user) = _UserLoaded;
  const factory UsersState.error(String message) = _Error;
}
