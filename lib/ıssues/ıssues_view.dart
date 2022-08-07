import 'dart:convert';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_projeleri/const.dart';
import 'package:flutter_projeleri/controllers/repo_controller.dart';
import 'package:flutter_projeleri/controllers/user_control.dart';
import 'package:flutter_projeleri/home/home.dart';
import 'package:flutter_projeleri/services/%C4%B1ssues_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grock/grock.dart';
import 'package:http/http.dart' as http;

import '../model/create_ıssue_model.dart';

class IssuesPage extends StatefulWidget {
  IssuesPage({Key? key}) : super(key: key);

  @override
  State<IssuesPage> createState() => _IssuesPageState();
}

class _IssuesPageState extends State<IssuesPage> {
  final UserController u = Get.find();
  final RepoController r = Get.put(RepoController());
  bool isLoading = false;

  final _titleControl = TextEditingController();
  final _bodyControl = TextEditingController();
  final _repos = TextEditingController();

  IssueService issueService = IssueService();

  CreateIssueModel _dataModel=CreateIssueModel();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    //debugPrint("$repolist");

    return !isLoading
        ? Scaffold(
            backgroundColor: bgColor,
            appBar: AppBar(
              title: Text(
                'Issue Post',
                style: regular18WhiteText,
              ),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: SingleChildScrollView(
              child: Obx(
                () => Center(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height * 0.1,
                          child: AutoSizeTextField(
                            cursorColor: greyTextColor,
                            controller: _titleControl,
                            style: regular15WhiteText,
                            maxLines: 1,
                            decoration: InputDecoration(
                                filled: true, //<-- SEE HERE
                                fillColor: bgSecondaryColor,
                                hintText: 'Başlığınızı yazın..',
                                labelText: 'Başlık',
                                labelStyle: regular15WhiteText,
                                hintStyle: regular15GreyText,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.transparent, width: 1.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                isDense: true,
                                contentPadding: const EdgeInsets.all(15)),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.3,
                          child: AutoSizeTextField(
                            cursorColor: greyTextColor,
                            controller: _bodyControl,
                            style: regular15WhiteText,
                            maxLines: 8,
                            decoration: InputDecoration(
                                filled: true, //<-- SEE HERE
                                fillColor: bgSecondaryColor,
                                hintText: 'Yorum yap..',
                                alignLabelWithHint: true,
                                labelText: 'Yorum',
                                labelStyle: regular15WhiteText,
                                hintStyle: regular15GreyText,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.transparent, width: 1.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                isDense: true,
                                contentPadding: const EdgeInsets.all(15)),
                          ),
                        ),
                        Text(
                          'Herkese Açık Repository Sayısı: ${u.userGet.value.publicRepos}',
                          style: regular15GreyText,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // ListView.builder(
                        //     itemCount: r.repoGet.length,
                        //     itemBuilder: (context, index) {
                        //       return Container(
                        //           child: Text(r.repoGet[index]!.name!,
                        //               maxLines: 4,
                        //               overflow: TextOverflow.ellipsis,
                        //               style: regular15WhiteText));
                        //     }),

                        Obx(() => CustomDropdown(
                              selectedStyle:
                                  TextStyle(color: Colors.blueAccent),
                              fillColor: bgSecondaryColor,
                              listItemStyle: TextStyle(
                                color: bgSecondaryColor,
                              ),
                              hintText: 'Repository seçin..',
                              items: r.repoGet.value
                                      .map<String>((e) => e.name!)
                                      .toList()
                                      .isEmpty
                                  ? ['Bekleyin']
                                  : r.repoGet.value
                                      .map<String>((e) => e.name!)
                                      .toList(),
                              controller: _repos,
                            )),

                        SizedBox(
                          height: 50,
                        ),
                        NeumorphicButton(
                          onPressed: () async {
                            String? tittle = _titleControl.text;
                            String? body = _bodyControl.text;
                            String? repo = _repos.text;
                            String? user = u.userGet.value.login.toString();

                          CreateIssueModel? dataMod= await issueService.submitData(tittle, body, repo, user);
                    setState(() {
                      _dataModel=dataMod!;
                    });

                          },
                          padding: EdgeInsets.all(10),
                          style: NeumorphicStyle(
                            color: myPrimaryColor,
                            shadowDarkColor: myPrimaryColor,
                            shadowLightColor: myPrimaryColor,
                            depth: 8,
                            intensity: 0.5,
                            shape: NeumorphicShape.convex,
                            boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(12)),
                          ),
                          child: Center(
                            child: Text(
                              'Oluştur',
                              style: regular15WhiteBoldText,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        : Container(
            child: const Center(child: CircularProgressIndicator()),
          );
  }
}
