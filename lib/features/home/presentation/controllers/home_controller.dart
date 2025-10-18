import 'package:example/common/core/utils/errors/exceptions.dart';
import 'package:example/features/home/domain/usecases/logout_usecase.dart';
import 'package:example/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:example/features/home/domain/usecases/userdata_usecase.dart';
import 'package:example/features/home/presentation/states/home_state.dart';
import 'package:example/common/core/utils/logger/app_logger.dart';
import 'package:toastification/toastification.dart';
import 'package:example/common/widgets/toast_message.dart';

class HomeController extends GetxController {
  final HomeState state;
  final GetHomeUseCase getHomeUseCase;
  final LogoutUseCase logoutUseCase;

  HomeController(
      {required this.logoutUseCase,
      required this.getHomeUseCase,
      required this.state});

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchHomeData();
  }

  Future<void> fetchHomeData() async {
    state.isLoading.value = true;

    try {
      final result = await getHomeUseCase();

      result.fold(
        (failure) {
          Log.error(failure, ["error while fetching home data"]);

          String errorMessage = 'Failed To Fetch User Data';
          if (failure is APIException) {
            errorMessage = failure.message;
          }

          showToastNotification(
            title: 'Failed To Fetch User Data',
            body: errorMessage,
            messageType: ToastificationType.error,
          );
          state.isLoading.value = false;
        },
        (data) {
          state.homeData.value = data;
          showToastNotification(
            title: 'User Data Fetched Successfully',
            body: data.message,
            messageType: ToastificationType.success,
          );
          state.isLoading.value = false;
        },
      );
    } catch (e, stackTrace) {
      Log.error("Unexpected error during fetching home data", e, stackTrace);
      showToastNotification(
        title: 'Login Failed',
        body: 'An unexpected error occurred. Please try again.',
        messageType: ToastificationType.error,
      );
      state.isLoading.value = false;
    }
  }

  Future<void> logoutUser() async {
    state.isLoading.value = true;

    try {
      final result = await logoutUseCase();

      result.fold(
        (failure) {
          Log.error(failure, ["error while logging out"]);

          String errorMessage = 'Failed To logged out';
          if (failure is APIException) {
            errorMessage = failure.message;
          }

          showToastNotification(
            title: 'Failed To Logged Out',
            body: errorMessage,
            messageType: ToastificationType.error,
          );
          state.isLoading.value = false;
        },
        (data) {
          showToastNotification(
            title: 'Success',
            body: data.message,
            messageType: ToastificationType.success,
          );
          if(data.success){
            Get.offAndToNamed(AppRoutes.register);
          }
          state.isLoading.value = false;
        },
      );
    } catch (e, stackTrace) {
      Log.error("Unexpected error during fetching home data", e, stackTrace);
      showToastNotification(
        title: 'Login Failed',
        body: 'An unexpected error occurred. Please try again.',
        messageType: ToastificationType.error,
      );
      state.isLoading.value = false;
    }
  }
}
