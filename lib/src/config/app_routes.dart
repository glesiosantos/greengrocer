import 'package:get/get.dart';
import 'package:greengrocer/src/config/app_constant.dart';
import 'package:greengrocer/src/pages/auth/sign_in_screen.dart';
import 'package:greengrocer/src/pages/auth/sign_up_screen.dart';
import 'package:greengrocer/src/pages/base/base_screen.dart';
import 'package:greengrocer/src/pages/splash/splash_screen.dart';

abstract class AppRoutes {
  static final routes = <GetPage>[
    GetPage(
      name: AppConstant.splashRoute,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppConstant.signInRoute,
      page: () => SignInScreen(),
    ),
    GetPage(
      name: AppConstant.signUpRoute,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: AppConstant.homeRoute,
      page: () => const BaseSreen(),
    ),
  ];
}
