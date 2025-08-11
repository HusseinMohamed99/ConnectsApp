import 'package:connects_app/core/networking/api_result.dart';
import 'package:connects_app/features/users/domain/entities/user_entity.dart';
import 'package:connects_app/features/users/domain/entities/users_page_entity.dart';

abstract class UsersRepository {
  /// Get a paginated list of users.
  Future<ApiResult<UsersPageEntity>> getUsersPage(int page);

  /// Get a single user by id.
  Future<ApiResult<UserEntity>> getUser(int id);
}
