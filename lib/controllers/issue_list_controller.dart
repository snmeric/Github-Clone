import 'package:flutter_projeleri/model/get_list_issue.dart';
import 'package:flutter_projeleri/services/issue_list_service.dart';
import 'package:get/get.dart';

class IssueListController extends GetxController {
  var issueListGet = <GetListIssiueModel>[].obs;
  String reposC;

  // Rx<TextEditingController> reposController = TextEditingController().obs;
  IssueListController({required this.reposC});
  var isLoading = true.obs;
  final getListIssiue = IssueListService();
  @override
  void onInit() {
    String repos = reposC.toString();
    getListIss(repos);
    super.onInit();
  }

  void getListIss(String repo) async {
    try {
      isLoading(true);
      var authIssueList = await getListIssiue.submitListIssie(repo);

      if (authIssueList != null) {
        issueListGet.value = authIssueList;
      }
    } finally {
      isLoading(false);
    }
  }
}
