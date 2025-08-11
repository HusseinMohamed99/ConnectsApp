import 'package:connects_app/features/users/data/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'single_user_response.g.dart';

@JsonSerializable()
class SingleUserResponse {
  SingleUserResponse({this.data});

  factory SingleUserResponse.fromJson(Map<String, dynamic> json) =>
      _$SingleUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SingleUserResponseToJson(this);

  final UserModel? data;
}
