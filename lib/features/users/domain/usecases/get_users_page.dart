import 'package:connects_app/core/networking/api_result.dart';
import 'package:connects_app/features/users/domain/entities/users_page_entity.dart';
import 'package:connects_app/features/users/domain/repositories/users_repository.dart';

class GetUsersPage {
  GetUsersPage(this._repo);
  final UsersRepository _repo;

  Future<ApiResult<UsersPageEntity>> call(int page) {
    return _repo.getUsersPage(page);
  }
}
