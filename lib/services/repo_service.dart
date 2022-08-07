import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_projeleri/model/get_repo_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grock/grock.dart';
import 'package:http/http.dart' as http;

class RepositoryService {
  Future<List<GetRepositoryModel>?>? getRepository() async {
    String baseUrl = "https://api.github.com/user/repos";
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
        //debugPrint(json[0].id);


        GetRepositoryModel repoModel =
            GetRepositoryModel.fromJson(json[0] as Map<String, dynamic>);
       //print(jsonResponse);
       
        List<GetRepositoryModel> repoModels=json.map<GetRepositoryModel>((e) =>GetRepositoryModel.fromJson(e)).toList();
        return repoModels;

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
