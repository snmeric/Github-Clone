import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projeleri/model/get_user.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grock/grock.dart';

class Service {
  final String baseUrl = "https://api.github.com/user";
  final dio = Dio();
  final box = GetStorage();

  Future<GetUserPlan?> getUser() async {
    
    String? token = box.read('token');

    var response = await dio.get(baseUrl,
        options: Options(headers: {
          "Authorization": "Bearer $token", // your github access token
        }));
    if (response.statusCode == 200) {
      var result = GetUserPlan.fromJson(response.data);
      print("Gelen Response=> ${response.data}");
      return result;
    } else {
      print("Hata kodu=> ${response.statusCode}");
      Grock.snackBar(
          title: "Bir sorun oluştu",
          description: "Hata kodu: ${response.statusCode}");
    }
  }
}
