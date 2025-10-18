import 'package:example/features/login/domain/entities/login_request_entity.dart';

class LoginRequestModel extends LoginRequestEntity {
  LoginRequestModel({
    required super.username,
    required super.password,
  });

  factory LoginRequestModel.fromEntity(LoginRequestEntity entity) {
    return LoginRequestModel(
      username: entity.username,
      password: entity.password,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }

  LoginRequestEntity toEntity() {
    return LoginRequestEntity(
      username: username,
      password: password,
    );
  }
}
