// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_users_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllUsersDto _$GetAllUsersDtoFromJson(Map<String, dynamic> json) =>
    GetAllUsersDto(
      success: json['success'] as bool,
      count: (json['count'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => UsersApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllUsersDtoToJson(GetAllUsersDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'count': instance.count,
      'data': instance.data,
    };
