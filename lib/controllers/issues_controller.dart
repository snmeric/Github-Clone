// import 'package:flutter_projeleri/model/create_%C4%B1ssue_model.dart';
// import 'package:flutter_projeleri/model/get_repo_model.dart';
// import 'package:flutter_projeleri/model/get_user.dart';
// import 'package:flutter_projeleri/services/%C4%B1ssues_service.dart';
// import 'package:flutter_projeleri/services/repo_service.dart';
// import 'package:flutter_projeleri/services/service.dart';
// import 'package:get/get.dart';

// class IssuesController extends GetxController {
//   var issueGet = <CreateIssueModel>[].obs;
//   var isLoading = true.obs;
//   final createissueService = IssueService();
//   @override
//   void onInit() {
//     getRepository();
//     super.onInit();
//   }

//   void getRepository() async {
//     try {
//       isLoading(true);
//       var authIssue = await createissueService.issuesService("${_bodyControl}","");

//       if (authIssue != null) {
//        // repoGet.value = authIssue;
//       }
//     } finally {
//       isLoading(false);
//     }
//   }
// }
