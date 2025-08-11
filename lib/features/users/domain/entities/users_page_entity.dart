import 'package:connects_app/features/users/domain/entities/user_entity.dart';

class UsersPageEntity {

  const UsersPageEntity({
    required this.page,
    required this.totalPages,
    required this.data,
  });
  final int page;
  final int totalPages;
  final List<UserEntity> data;

  bool get isLastPage => page >= totalPages;
}
