import 'package:flutter_projeleri/app_pages.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grock/grock.dart';

class HomeController extends GetxController {
  final box = GetStorage();
  var name = "";

  @override
  void onInit() {
    super.onInit();
    name = box.read("name");
  }


  void onReady() {
    super.onReady();
  }

  void onClose() {
    super.onClose();
  }

  logout() {
    //_authenticationNotifier.logOutGithub();
    box.erase();
    Get.offAllNamed(Routes.LOGIN);
    Grock.snackBar(title: 'Başarılı', description: "Başarılı bir şekilde çıkış yaptınız.");
  }
}
