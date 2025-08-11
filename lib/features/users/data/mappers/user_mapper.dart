import 'package:connects_app/features/users/data/models/user_model.dart';
import 'package:connects_app/features/users/domain/entities/user_entity.dart';

extension UserModelMapper on UserModel {
  /// Convert API transport model to domain entity.
  UserEntity toEntity() => UserEntity(
    id: id ?? 0,
    email: email ?? '',
    firstName: firstName ?? '',
    lastName: lastName ?? '',
    avatar: avatar ?? '',
  );
}
