import 'package:connects_app/features/users/data/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'users_page_model.g.dart';

@JsonSerializable()
class UsersPageModel {
  UsersPageModel({this.page, this.totalPages, this.data});

  factory UsersPageModel.fromJson(Map<String, dynamic> json) =>
      _$UsersPageModelFromJson(json);

  Map<String, dynamic> toJson() => _$UsersPageModelToJson(this);

  final int? page;
  @JsonKey(name: 'total_pages')
  final int? totalPages;
  final List<UserModel>? data;
}
