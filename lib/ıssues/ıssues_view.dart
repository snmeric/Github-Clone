// ignore_for_file: library_private_types_in_public_api

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_projeleri/const.dart';
import 'package:flutter_projeleri/controllers/repo_controller.dart';
import 'package:flutter_projeleri/controllers/user_control.dart';
import 'package:flutter_projeleri/services/%C4%B1ssues_service.dart';
import 'package:get/get.dart';
import 'package:grock/grock.dart';

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
  // single choice value
  int tag = 0;
  List<String> options = [
    'bug',
    'documentation',
    'duplicate',
    'enhancement',
    'good first issue',
    'help wanted',
    'invalid',
    'question',
    'wontfix'
  ];

  final _titleControl = TextEditingController();
  final _bodyControl = TextEditingController();
  final _repos = TextEditingController();

  IssueService issueService = IssueService();

  CreateIssueModel _dataModel = CreateIssueModel();

  bool titleValidate(String tittle, String repo) {
    if (tittle.isEmpty || repo.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

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
                            maxLength: 10,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                filled: true, //<-- SEE HERE
                                fillColor: bgSecondaryColor,
                                hintText: 'Başlığınızı yazın..',
                                labelText: 'Başlık*',
                                labelStyle: regular15WhiteText,
                                hintStyle: regular15GreyText,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
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
                            textInputAction: TextInputAction.next,
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
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.transparent, width: 1.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                isDense: true,
                                contentPadding: const EdgeInsets.all(15)),
                          ),
                        ),
                        Center(
                          child: Text(
                            'Herkese Açık Repository Sayısı: ${u.userGet.value.publicRepos}',
                            style: regular15GreyText,
                          ),
                        ),
                        Content(
                          title: 'Label',
                          child: ChipsChoice<int>.single(
                            value: tag,
                            onChanged: (val) => setState(() => tag = val),
                            choiceItems: C2Choice.listFrom<int, String>(
                              source: options,
                              value: (i, v) => i,
                              label: (i, v) => v,
                            ),
                            wrapped: true,
                            choiceActiveStyle: const C2ChoiceStyle(
                                color: mySecondaryColor,
                                borderColor: bgSecondaryColor,
                                borderWidth: 0,
                                // borderColor: Colors.transparent,
                                backgroundColor: bgSecondaryColor),
                            choiceStyle: const C2ChoiceStyle(
                              color: Colors.grey,
                              borderOpacity: 0,
                              borderColor: bgSecondaryColor,
                              borderWidth: 0,
                              backgroundColor: bgSecondaryColor,
                              //borderColor: Colors.transparent,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(
                          () => CustomDropdown(
                            selectedStyle:
                                const TextStyle(color: Colors.blueAccent),
                            fillColor: bgSecondaryColor,
                            listItemStyle: const TextStyle(
                              color: bgSecondaryColor,
                            ),
                            hintText: 'Repository seçin.. *',
                            // ignore: invalid_use_of_protected_member
                            items: r.repoGet.value
                                    .map<String>((e) => e.name!)
                                    .toList()
                                    .isEmpty
                                ? ['Bekleyin']
                                // ignore: invalid_use_of_protected_member
                                : r.repoGet.value
                                    .map<String>((e) => e.name!)
                                    .toList(),
                            controller: _repos,
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        NeumorphicButton(
                          onPressed: () async {
                            if (titleValidate(
                                    _titleControl.text, _repos.text) ==
                                true) {
                              String? tittle = _titleControl.text;
                              String? body = _bodyControl.text;
                              String? repo = _repos.text;
                              String? user = u.userGet.value.login.toString();
                              String? label = options[tag].toString();

                              // print(tittle);
                              // print(repo);
                              // print(options[tag]);
                              CreateIssueModel? dataMod = await issueService
                                  .submitData(tittle, body, repo, user, label);
                              setState(() {
                                _dataModel = dataMod!;
                              });
                            } else {
                              Grock.snackBar(
                                  title: 'Dikkat',
                                  description:
                                      'Lütfen Repository ve Başlığı doldurduğunuzdan emin olun.');
                            }
                          },
                          padding: const EdgeInsets.all(10),
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
                        const SizedBox(
                          height: 30,
                        )
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

class Content extends StatefulWidget {
  final String? title;
  final Widget? child;

  const Content({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content>
    with AutomaticKeepAliveClientMixin<Content> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(widget.title!, style: regular15WhiteText),
          Flexible(fit: FlexFit.loose, child: widget.child!),
        ],
      ),
    );
  }
}
