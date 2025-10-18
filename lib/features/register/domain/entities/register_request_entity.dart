class RegisterRequestEntity {
  final String email;
  final String password;
  final String role;
  final String username;

  RegisterRequestEntity({
    required this.email,
    required this.password,
    required this.role,
    required this.username,
  });
}
