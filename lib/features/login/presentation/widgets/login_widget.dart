import 'package:example/common/core/utils/validators/app_validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:example/features/login/presentation/controllers/login_controller.dart';
import 'package:example/common/resources/app_resources/app_colors.dart';
import 'package:example/common/resources/app_resources/app_sizes.dart';
import 'package:example/common/widgets/textField.dart';

class LoginWidget extends GetView<LoginController> {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppSizes.w20),
      child: Form(
        key: controller.state.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: AppSizes.h40,
          children: [
            const Text(
              'Login',
              textAlign: TextAlign.center,
            ),

            // Username Field
            buildTextField(
              controller: controller.state.usernameController,
              label: 'Username',
              hintText: 'Enter your username',
            ),

            // Password Field
            buildTextField(
              controller: controller.state.passwordController,
              label: 'Password',
              hintText: 'Enter your password',
              validator: Validators.validateLoginPassword,
              obscureText: false,
            ),

            // Login Button
            Obx(() => ElevatedButton(
              onPressed: controller.state.isLoading.value
                  ? null
                  : controller.loginUser,
              child: controller.state.isLoading.value
                  ? SizedBox(
                height: AppSizes.h20,
                width: AppSizes.w20,
                child: const CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.white,
                  ),
                ),
              )
                  : const Text(
                'Login',
              ),
            )),


          ],
        ),
      ),
    );
  }
}
