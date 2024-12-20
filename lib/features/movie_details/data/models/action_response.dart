import 'package:freezed_annotation/freezed_annotation.dart';

part 'action_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ActionResponse {
  final bool success;
  final int statusCode;
  final String statusMessage;

  ActionResponse({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
  });

  factory ActionResponse.fromJson(Map<String, dynamic> json) =>
      _$ActionResponseFromJson(json);
}
