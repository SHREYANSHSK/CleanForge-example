import 'package:example/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:example/features/register/domain/usecases/register_usecase.dart';
import 'package:example/features/register/domain/entities/register_request_entity.dart';
import 'package:example/features/register/presentation/states/register_state.dart';
import 'package:example/common/core/utils/logger/app_logger.dart';
import 'package:example/common/core/utils/errors/exceptions.dart';
import 'package:toastification/toastification.dart';
import 'package:example/common/widgets/toast_message.dart';

/// [RegisterController] manages UI logic and state in clean architecture
/// Coordinates between UI events and use cases, handling presentation logic
/// Best Practice: Separates UI logic from business logic and keeps UI state management clean
class RegisterController extends GetxController {
  final RegisterState state;
  final RegisterUserUseCase registerUserUseCase;

  RegisterController({
    required this.registerUserUseCase,
    required this.state,
  });

  Future<void> registerUser() async {
    if (!state.formKey.currentState!.validate()) {
      return;
    }

    state.isLoading.toggle();

    try {
      final request = RegisterRequestEntity(
        email: state.emailController.text.trim(),
        password: state.passwordController.text,
        role: "ADMIN",
        username: state.usernameController.text.trim(),
      );

      final result = await registerUserUseCase(
        RegisterUserUseCaseParams(request: request),
      );

      result.fold(
        (failure) {
          Log.error(failure, ["error while registering user"]);

          String errorMessage = 'Registration failed';
          if (failure is APIException) {
            errorMessage = failure.message;
          }

          showToastNotification(
            title: 'Registration Failed',
            body: errorMessage,
            messageType: ToastificationType.error,
          );
          state.isLoading.value = false;
        },
        (data) {
          state.registerData.value = data;
          showToastNotification(
            title: data.success
                ? 'Registration Successful'
                : 'Registration Unsuccessful',
            body: data.message,
            messageType: data.success
                ? ToastificationType.success
                : ToastificationType.error,
          );
          state.isLoading.value = false;
          if (data.success) {
            Get.offAndToNamed(AppRoutes.login);
          }
        },
      );
    } catch (e, stackTrace) {
      Log.error("Unexpected error during registration", e, stackTrace);
      showToastNotification(
        title: 'Registration Failed',
        body: 'An unexpected error occurred. Please try again.',
        messageType: ToastificationType.error,
      );
      state.isLoading.value = false;
    }
  }

  @override
  void onClose() {
    state.emailController.dispose();
    state.passwordController.dispose();
    state.usernameController.dispose();
    super.onClose();
  }
}
