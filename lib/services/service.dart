import 'dart:convert';

import 'package:flutter_projeleri/model/get_user.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grock/grock.dart';
import 'package:http/http.dart' as http;

class Service {
  Future<GetUserModel?> getUser() async {
    String baseUrl = "https://api.github.com/user";
    var client = http.Client();
    final box = GetStorage();
    String? token = box.read('token');

    var uri = Uri.parse(baseUrl);

    var response = await client.get(uri, headers: {
      'Accept': 'aplication/vnd.github+json',
      'Authorization': 'Bearer $token',
    });
    try {
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        GetUserModel userModel =
            GetUserModel.fromJson(json as Map<String, dynamic>);
        //print("$json");
        return userModel;

      } else {
        print("Hata kodu=> ${response.statusCode}");

        Grock.snackBar(
            title: "Bir sorun oluştu",
            description: "Hata kodu: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
