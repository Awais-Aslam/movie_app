class ActionResponse {
  final bool success;
  final int statusCode;
  final String statusMessage;

  ActionResponse({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
  });

  factory ActionResponse.fromJson(Map<String, dynamic> json) {
    return ActionResponse(
      success: json['success'],
      statusCode: json['status_code'],
      statusMessage: json['status_message'],
    );
  }
}
