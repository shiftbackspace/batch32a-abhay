// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersApiModel _$UsersApiModelFromJson(Map<String, dynamic> json) =>
    UsersApiModel(
      id: json['_id'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      profilePicture: json['profilePicture'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$UsersApiModelToJson(UsersApiModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'phone': instance.phone,
      'profilePicture': instance.profilePicture,
      'password': instance.password,
    };
