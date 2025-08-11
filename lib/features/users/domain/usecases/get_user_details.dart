import 'package:connects_app/core/networking/api_result.dart';
import 'package:connects_app/features/users/domain/entities/user_entity.dart';
import 'package:connects_app/features/users/domain/repositories/users_repository.dart';

class GetUserDetails {
  GetUserDetails(this._repo);
  final UsersRepository _repo;

  Future<ApiResult<UserEntity>> call(int id) {
    return _repo.getUser(id);
  }
}
