// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersPageModel _$UsersPageModelFromJson(Map<String, dynamic> json) =>
    UsersPageModel(
      page: (json['page'] as num?)?.toInt(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UsersPageModelToJson(UsersPageModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'data': instance.data,
    };
