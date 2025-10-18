import 'package:example/common/core/utils/validators/app_validators.dart';
import 'package:example/common/widgets/textField.dart';
import 'package:example/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:example/features/register/presentation/controllers/register_controller.dart';
import 'package:example/common/resources/app_resources/app_colors.dart';
import 'package:example/common/resources/app_resources/app_sizes.dart';

class RegisterWidget extends GetView<RegisterController> {
  const RegisterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppSizes.w20),
      child: Form(
        key: controller.state.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: AppSizes.h20,
          children: [
            const Text(
              'Register',
              textAlign: TextAlign.center,
            ),

            // Email Field
            buildTextField(
              controller: controller.state.emailController,
              label: 'Email',
              hintText: 'Enter your email',
              validator: Validators.validateEmail,
              keyboardType: TextInputType.emailAddress,
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
              validator: Validators.validatePassword,
              obscureText: false,
            ),

            // Register Button
            Obx(() => ElevatedButton(
                  onPressed: controller.state.isLoading.value
                      ? null
                      : controller.registerUser,
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
                          'Register',
                        ),
                )),

            // login button
            ElevatedButton(
              onPressed: () => Get.toNamed(AppRoutes.login),
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
            )
          ],
        ),
      ),
    );
  }
}
