import 'package:example/features/login/domain/entities/login_request_entity.dart';
import 'package:example/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:example/features/login/domain/usecases/login_usecase.dart';
import 'package:example/features/login/presentation/states/login_state.dart';
import 'package:example/common/core/utils/logger/app_logger.dart';
import 'package:toastification/toastification.dart';
import 'package:example/common/widgets/toast_message.dart';
import 'package:example/common/core/utils/errors/exceptions.dart';

class LoginController extends GetxController {
  final LoginState state;
  final LoginUserUseCase loginUserUseCase;

  LoginController({
    required this.loginUserUseCase,
    required this.state,
  });





  Future<void> loginUser() async {
    if (!state.formKey.currentState!.validate()) {
      return;
    }

    state.isLoading.value = true;

    try {
      final request = LoginRequestEntity(
        username: state.usernameController.text.trim(),
        password: state.passwordController.text,
      );

      final result = await loginUserUseCase(
        LoginUserUseCaseParams(request: request),
      );

      result.fold(
        (failure) {
          Log.error(failure, ["error while logging in user"]);

          String errorMessage = 'Login failed';
          if (failure is APIException) {
            errorMessage = failure.message;
          }

          showToastNotification(
            title: 'Login Failed',
            body: errorMessage,
            messageType: ToastificationType.error,
          );
          state.isLoading.value = false;
        },
        (data) {
          state.loginData.value = data;
          showToastNotification(
            title: data.success ? 'Login Successful':'Login Unsuccessful',
            body: data.message,
            messageType: data.success ? ToastificationType.success : ToastificationType.error,
          );
          state.isLoading.value = false;

          if(data.success) {
            Get.offAndToNamed(AppRoutes.home);
          }
        },
      );
    } catch (e, stackTrace) {
      Log.error("Unexpected error during login", e, stackTrace);
      showToastNotification(
        title: 'Login Failed',
        body: 'An unexpected error occurred. Please try again.',
        messageType: ToastificationType.error,
      );
      state.isLoading.value = false;
    }
  }


  @override
  void onClose() {
    state.usernameController.dispose();
    state.passwordController.dispose();
    super.onClose();
  }
}
