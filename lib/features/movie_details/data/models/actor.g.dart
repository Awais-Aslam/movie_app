// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Actor _$ActorFromJson(Map<String, dynamic> json) => Actor(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      originalName: json['original_name'] as String,
      character: json['character'] as String,
      profilePath: json['profile_path'] as String?,
      gender: (json['gender'] as num).toInt(),
      popularity: (json['popularity'] as num).toDouble(),
      knownForDepartment: json['known_for_department'] as String,
    );

Map<String, dynamic> _$ActorToJson(Actor instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'original_name': instance.originalName,
      'character': instance.character,
      'profile_path': instance.profilePath,
      'gender': instance.gender,
      'popularity': instance.popularity,
      'known_for_department': instance.knownForDepartment,
    };
