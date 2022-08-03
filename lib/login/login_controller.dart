import 'package:flutter_projeleri/app_pages.dart';
import 'package:flutter_projeleri/login/github_signin.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grock/grock.dart';



class LoginController extends GetxController {

  final getStorge = GetStorage();
  var name = "";
  @override
  void onInit() {
    super.onInit();
  }

  void onReady(){
    super.onReady();
  }
  void onClose(){
    super.onClose();
  }

  login(){
    getStorge.write("id", 1);
    Get.offAllNamed(Routes.HOME);
    Grock.snackBar(title: 'Başarılı', description: "Başarılı bir şekilde giriş yaptınız.");
  }
}
