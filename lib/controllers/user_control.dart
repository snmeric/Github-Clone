import 'package:flutter_projeleri/model/get_user.dart';
import 'package:flutter_projeleri/services/service.dart';
import 'package:get/get.dart';

class UserController extends GetxController{
  var user=<GetUserPlan?>[].obs;
  var isLoading=true.obs;
  final service=Service();
}