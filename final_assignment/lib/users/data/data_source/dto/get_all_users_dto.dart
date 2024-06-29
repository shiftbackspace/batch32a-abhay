import 'package:Busx/users/data/model/users_api_model.dart';
import 'package:Busx/users/domain/entity/user_entity.dart';

import 'package:json_annotation/json_annotation.dart';

part 'get_all_users_dto.g.dart';

@JsonSerializable()
class GetAllUsersDto {
  final bool success;
  final int count;
  final List<UsersApiModel> data;

  GetAllUsersDto({
    required this.success,
    required this.count,
    required this.data,
  });
  List<UsersEntity> toEntity() {
    return data.map((e) => e.toEntity()).toList();
  }

  Map<String, dynamic> toJson() => _$GetAllUsersDtoToJson(this);

  factory GetAllUsersDto.fromJson(Map<String, dynamic> json) =>
      _$GetAllUsersDtoFromJson(json);

  
}
