import 'package:flutter/material.dart';
import 'package:flutter_projeleri/const.dart';

import 'package:get/get.dart';

import 'splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Image.asset('assets/images/github_logo.png',color: Colors.white,width: 200,)
      ),
    );
  }
}