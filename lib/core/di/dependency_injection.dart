import 'package:connects_app/core/networking/api_service.dart';
import 'package:connects_app/core/networking/dio_factory.dart';
import 'package:connects_app/features/users/data/repositories/users_repository_impl.dart';
import 'package:connects_app/features/users/domain/repositories/users_repository.dart';
import 'package:connects_app/features/users/domain/usecases/get_user_details.dart';
import 'package:connects_app/features/users/domain/usecases/get_users_page.dart';
import 'package:connects_app/features/users/presentation/cubit/user_details_cubit.dart';
import 'package:connects_app/features/users/presentation/cubit/users_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

/// ✅ Main entry for initializing all dependencies
void _registerLazySingleton<T extends Object>(T Function() factory) {
  if (!getIt.isRegistered<T>()) {
    getIt.registerLazySingleton<T>(factory);
  }
}

void _registerFactory<T extends Object>(T Function() factory) {
  if (!getIt.isRegistered<T>()) {
    getIt.registerFactory<T>(factory);
  }
}

Future<void> setupGetIt() async {
  _registerCoreServices();
  _registerUsersFeature();
}

/// ✅ Register Dio, API service
void _registerCoreServices() {
  final dio = DioFactory.getDio();
  _registerLazySingleton<ApiService>(() => ApiService(dio));
}

/// ✅ Register Users Feature
void _registerUsersFeature() {
  // Repository
  _registerLazySingleton<UsersRepository>(
    () => UsersRepositoryImpl(getIt<ApiService>()),
  );

  // Use cases
  _registerLazySingleton(() => GetUsersPage(getIt<UsersRepository>()));
  _registerLazySingleton(() => GetUserDetails(getIt<UsersRepository>()));

  // Cubit
  _registerFactory(
    () => UsersCubit(
      getUsersPageUseCase: getIt<GetUsersPage>(),
      getUserUseCase: getIt<GetUserDetails>(),
    ),
  );
  _registerFactory(() => UserDetailsCubit(getIt<GetUserDetails>()));

}
