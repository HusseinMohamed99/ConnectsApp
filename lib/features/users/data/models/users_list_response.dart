import 'package:connects_app/features/users/data/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'users_list_response.g.dart';

@JsonSerializable()
class UsersListResponse {
  UsersListResponse({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
  });

  factory UsersListResponse.fromJson(Map<String, dynamic> json) =>
      _$UsersListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UsersListResponseToJson(this);

  final int? page;

  @JsonKey(name: 'per_page')
  final int? perPage;

  final int? total;

  @JsonKey(name: 'total_pages')
  final int? totalPages;

  final List<UserModel>? data;
}
