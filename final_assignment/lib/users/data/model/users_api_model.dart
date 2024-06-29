import 'package:Busx/users/domain/entity/user_entity.dart';

import 'package:json_annotation/json_annotation.dart';

part 'users_api_model.g.dart';

@JsonSerializable()
class UsersApiModel {
  @JsonKey(name: "_id")
  final String id;
  final String fullName;
  final String email;
  final String phone;
  final String? profilePicture;
  final String? password;

  UsersApiModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.profilePicture,
    required this.password,
  });

  factory UsersApiModel.fromJson(Map<String, dynamic> json) =>
      _$UsersApiModelFromJson(json);

  // To entity
  UsersEntity toEntity() {
    return UsersEntity(
        fullName: fullName,
        email: email,
        phone: phone,
        image: profilePicture ?? '',
        password: password ?? '');
  }
}
