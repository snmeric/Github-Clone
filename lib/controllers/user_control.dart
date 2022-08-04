import 'package:flutter_projeleri/model/get_user.dart';
import 'package:flutter_projeleri/services/service.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var userGet = GetUserModel().obs;
  var isLoading = true.obs;
  final service = Service();
  @override
  void onInit() {
    getUser();
    super.onInit();
  }

  void getUser() async {
    try {
      isLoading(true);
      var authUser = await service.getUser();

      if (authUser != null) {
        userGet.value = authUser;
      }
    } finally {
      isLoading(false);
    }
  }
}
