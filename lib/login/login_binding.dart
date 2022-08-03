import 'package:flutter/material.dart';
import 'package:flutter_projeleri/login/login_controller.dart';


import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
