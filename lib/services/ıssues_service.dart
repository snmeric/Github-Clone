import 'dart:convert';

import 'package:flutter_projeleri/home/home.dart';
import 'package:flutter_projeleri/model/create_%C4%B1ssue_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grock/grock.dart';
import 'package:http/http.dart' as http;

class IssueService {
  Future<CreateIssueModel?> submitData(String tittleControl, String bodyControl,
      String repoControl, String userControl,String label) async {
    //  print("KULLANICI ADI: $_userControl, Repo ADI: $_repoControl ");
    // print("Başlık: $_tittleControl, Body: $_bodyControl ");

    String baseUrl =
        "https://api.github.com/repos/$userControl/$repoControl/issues";
    var client = http.Client();
    final box = GetStorage();
    String? token = box.read('token');
    // print("token : $token");

    var uri = Uri.parse(baseUrl);

    var response = await client.post(uri,
        headers: {
          'Accept': 'aplication/vnd.github+json',
          'Authorization': 'Token $token',
        },
        body: jsonEncode({
          "title": tittleControl,
          "body": bodyControl,
          "labels":[label]
        }));

    //var data = response.body;
    //print(data);

    try {
      if (response.statusCode == 201) {
        Grock.snackBar(
            title: "Başarılı",
            description: "Başarılı bir şekilde issue oluşturdunuz.");

        // print("CODE 201");
        final responseString = jsonDecode(response.body);
        // Grock.snackBar(
        //     title: "Başarılı",
        //     description: "Başarılı bir şekilde issue oluşturuldu.");
        Get.to(() => HomePage(), transition: Transition.fade);
        CreateIssueModel issueListModel =
            CreateIssueModel.fromJson(responseString as Map<String, dynamic>);
        return issueListModel;

        // final json = jsonDecode(response.body);

        // print("$json");
        // return userModel;

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
