// ignore_for_file: constant_identifier_names

import 'package:flutter_projeleri/home/home.dart';
import 'package:flutter_projeleri/home/home_binding.dart';
import 'package:flutter_projeleri/login/login_binding.dart';
import 'package:flutter_projeleri/login/login_page.dart';
import 'package:flutter_projeleri/splash/splash_binding.dart';
import 'package:flutter_projeleri/splash/splash_page.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomePage(),
    
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(seconds: 1),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(seconds: 2),
      binding: SplashBinding(),
    ),
  ];
}

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const SPLASH = _Paths.SPLASH;
  static const LOGIN = _Paths.LOGIN;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const SPLASH = '/splash';
  static const LOGIN = '/login';
}
