// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActionResponse _$ActionResponseFromJson(Map<String, dynamic> json) =>
    ActionResponse(
      success: json['success'] as bool,
      statusCode: (json['status_code'] as num).toInt(),
      statusMessage: json['status_message'] as String,
    );

Map<String, dynamic> _$ActionResponseToJson(ActionResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status_code': instance.statusCode,
      'status_message': instance.statusMessage,
    };
