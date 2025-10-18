class LogOutUserEntity {
  final int statusCode;
  final String message;
  final bool success;

  LogOutUserEntity({
    required this.statusCode,
    required this.message,
    required this.success,
  });
}