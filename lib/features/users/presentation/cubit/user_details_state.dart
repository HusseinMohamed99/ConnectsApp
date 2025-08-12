part of 'user_details_cubit.dart';

@freezed
class UserDetailsState with _$UserDetailsState {
  const factory UserDetailsState.loading() = _Loading;
  const factory UserDetailsState.loaded(UserEntity user) = _Loaded;
  const factory UserDetailsState.error(String message) = _Error;
}
