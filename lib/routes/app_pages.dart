import 'package:example/features/login/presentation/bindings/login_binding.dart';
import 'package:example/features/login/presentation/pages/login_page.dart';
import 'package:example/features/register/presentation/bindings/register_binding.dart';
import 'package:example/features/register/presentation/pages/register_page.dart';
import 'package:get/get.dart';
import 'package:example/features/home/presentation/bindings/home_binding.dart';
import 'package:example/features/home/presentation/pages/home_page.dart';
import 'package:example/routes/app_routes.dart';
import 'package:example/app/pageNotFound.dart';

class AppPages {
  static const initial = AppRoutes.register;

  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.pageNotFound,
      page: () => const PageNotFound(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
  ];
}
