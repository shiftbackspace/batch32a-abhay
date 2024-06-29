import 'package:Busx/features/auth/domain/entity/auth_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_api_model.g.dart';

@JsonSerializable()
class AuthApiModel {
  @JsonKey(name: '_id')
  final String? id;
  final String fname;
  final String lname;
  final String username;
  final String? password;

  AuthApiModel(
      {required this.id,
      required this.fname,
      required this.lname,
      required this.username,
      required this.password});

  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  //api  To entity
  factory AuthApiModel.toEntity(AuthApiModel apiModel) {
    return AuthApiModel(
        id: apiModel.id,
        fname: apiModel.fname,
        lname: apiModel.lname,
        username: apiModel.username,
        password: apiModel.password);
  }

  //api  From entity
  factory AuthApiModel.fromEntity(AuthEntity entity) {
    return AuthApiModel(
        id: entity.id,
        fname: entity.fname,
        lname: entity.lname,
        username: entity.username,
        password: entity.password);
  }
}
