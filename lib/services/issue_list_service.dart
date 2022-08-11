import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_projeleri/controllers/repo_controller.dart';
import 'package:flutter_projeleri/controllers/user_control.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grock/grock.dart';
import 'package:http/http.dart' as http;

import '../model/get_list_issue.dart';

class IssueListService {
  Future<List<GetListIssiueModel>?>? submitListIssie(String repo) async {
   
    UserController u = Get.find();
    final box = GetStorage();
    String secilenRepo = repo.toString();
    String userName = u.userGet.value.login.toString();
    String baseUrl =
        "https://api.github.com/repos/$userName/$secilenRepo/issues";
    var client = http.Client();

    String? token = box.read('token');

    var uri = Uri.parse(baseUrl);

    var response = await client.get(
      uri,
      headers: {
        'Accept': 'aplication/vnd.github+json',
        'Authorization': 'Token $token',
      },
    );

    try {
      if (response.statusCode == 200) {
        Grock.snackBar(
            title: "Başarılı",
            description: "Başarılı bir şekilde issue görüntülendi.");

        final json = jsonDecode(response.body);
        //debugPrint(json[0].id);

        //print(jsonResponse);
        // GetListIssiueModel issueGetList =
        //     GetListIssiueModel.fromJson(json[0] as Map<String, dynamic>);

        List<GetListIssiueModel> issueModelss = json
            .map<GetListIssiueModel>((e) => GetListIssiueModel.fromJson(e))
            .toList();

        return issueModelss;
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
