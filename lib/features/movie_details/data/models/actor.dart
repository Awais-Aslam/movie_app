import 'package:freezed_annotation/freezed_annotation.dart';

part 'actor.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Actor {
  final int id;
  final String name;
  final String originalName;
  final String character;
  final String? profilePath;
  final int gender;
  final double popularity;
  final String knownForDepartment;

  Actor({
    required this.id,
    required this.name,
    required this.originalName,
    required this.character,
    this.profilePath,
    required this.gender,
    required this.popularity,
    required this.knownForDepartment,
  });

  factory Actor.fromJson(Map<String, dynamic> json) => _$ActorFromJson(json);

  Map<String, dynamic> toJson() => _$ActorToJson(this);
}
