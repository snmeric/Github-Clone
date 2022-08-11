import 'package:flutter/material.dart';
import 'package:flutter_projeleri/const.dart';
import 'package:flutter_projeleri/controllers/issue_list_controller.dart';
import 'package:flutter_projeleri/model/get_list_issue.dart';
import 'package:flutter_projeleri/services/issue_list_service.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class IssueListView extends StatelessWidget {
  bool isLoading = false;
  TextEditingController repCont;
  IssueListView({required this.repCont, super.key});

  IssueListService serviceIssueList = IssueListService();

  List<GetListIssiueModel> issues = [];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    String rep = repCont.text;
    final now = DateTime.now();
    String formatter = DateFormat.yMd().add_jm().format(now);
    final IssueListController c = Get.put(IssueListController(reposC: rep));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Issue Listele',
          style: regular18WhiteText,
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: bgColor,
      ),
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              if (c.isLoading.value) {
                return SizedBox(
                    height: MediaQuery.of(context).size.height / 1.3,
                    child: const Center(child: CircularProgressIndicator()));
              }
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: c.issueListGet.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: width * 0.8,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 38, 48, 66),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15)),
                                  border: Border.all(
                                    color: Color.fromARGB(255, 99, 132, 194),
                                    width: 1.0,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Başlık: ',
                                      style: regular16WhiteBoldText,
                                    ),
                                    Text(
                                      '${c.issueListGet.value[index].title}',
                                      style: regular15WhiteText,
                                    ),
                                   
                                    Text(
                                        'Yorum Sayısı: ${c.issueListGet.value[index].comments}',style: regular13GreyText,)
                                  ],
                                )),
                            Container(
                                width: width * 0.8,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  // gradient: LinearGradient(
                                  //   colors: [
                                  //     Color.fromARGB(255, 39, 39, 39),
                                  //     Color.fromARGB(255, 105, 105, 105),
                                  //   ],
                                  // ),
                                  border: Border.all(
                                    color: Color.fromARGB(255, 99, 132, 194),
                                    width: 1.0,
                                  ),
                                  color: bgSecondaryColor,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15)),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      '${c.issueListGet.value[index].body}',
                                      style: regular15WhiteText,
                                    ),
                                  ],
                                )),
                          ],
                        ));
                  },
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}

// Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     // ElevatedButton(onPressed: () {
//                                     //   print(c.issueListGet.value.map((e) => e.));
//                                     // }, child: Text('Get Data')),
//                                     Expanded(
//                                       child: Container(
//                                           padding: const EdgeInsets.only(
//                                               left: 25, right: 25, top: 5),
//                                           width: double.infinity,
//                                           decoration: const BoxDecoration(
//                                             borderRadius: BorderRadius.only(
//                                                 topLeft: Radius.circular(45),
//                                                 topRight: Radius.circular(45)),
//                                             color: bgColor,
//                                           ),
//                                           child: ListView(
//                                             physics: const BouncingScrollPhysics(),
//                                             children: [
//                                               _itemChat(
//                                                 avatar: 'assets/images/github_logo.png',
//                                                 chat: 1,
//                                                 message:
//                                     // ignore: invalid_use_of_protected_member
//                                     '${c.issueListGet.value.map((e) => e.title)}',
//                                 time: '18.00',
//                               ),
//                               _itemChat(
//                                 chat: 0,
//                                 message: 'Okey 🐣',
//                                 time: '18.00',
//                               ),
//                               _itemChat(
//                                 avatar: 'assets/images/github_logo.png',
//                                 chat: 1,
//                                 message:
//                                     'It has survived not only five centuries, 😀',
//                                 time: '18.00',
//                               ),
//                               _itemChat(
//                                 chat: 0,
//                                 message:
//                                     'Contrary to popular belief, Lorem Ipsum is not simply random text. 😎',
//                                 time: '18.00',
//                               ),
//                               _itemChat(
//                                 avatar: 'assets/images/github_logo.png',
//                                 chat: 1,
//                                 message:
//                                     'The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.',
//                                 time: '18.00',
//                               ),
//                               _itemChat(
//                                 avatar: 'assets/images/github_logo.png',
//                                 chat: 1,
//                                 message: '😅 😂 🤣',
//                                 time: '18.00',
//                               ),
//                             ],
//                           )),
//                     ),
//                   ],
//                 ),

// 0 = Send
// 1 = Recieved
_itemChat({int? chat, String? avatar, message, time}) {
  return Row(
    mainAxisAlignment:
        chat == 0 ? MainAxisAlignment.end : MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      avatar != null
          ? Avatar(
              image: avatar,
              size: 35,
            )
          : Text(
              '$time',
              style: TextStyle(color: Colors.grey.shade400),
            ),
      Flexible(
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: chat == 0 ? bgSecondaryColor : bgSecondaryColor,
            borderRadius: chat == 0
                ? const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  )
                : const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
          ),
          child: Text(
            '$message',
            style: regular13WhiteText,
          ),
        ),
      ),
      chat == 1
          ? Text(
              '$time',
              style: TextStyle(color: Colors.grey.shade400),
            )
          : const SizedBox(),
    ],
  );
}

class Avatar extends StatelessWidget {
  final double size;
  final image;
  final EdgeInsets margin;
  Avatar({this.image, this.size = 50, this.margin = const EdgeInsets.all(0)});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }
}
