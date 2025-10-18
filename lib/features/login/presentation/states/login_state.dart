import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:example/features/login/domain/entities/login_entity.dart';

class LoginState extends GetXState {
  RxBool isLoading = false.obs;
  final loginData = Rxn<LoginEntity>();

  // Form controllers
  final passwordController = TextEditingController(text: "test@123");
  final usernameController = TextEditingController(text: "doejohn",);

  // Form validation
  final formKey = GlobalKey<FormState>();

 
}
