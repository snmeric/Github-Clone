import 'package:flutter_projeleri/model/get_repo_model.dart';
import 'package:flutter_projeleri/services/repo_service.dart';
import 'package:get/get.dart';

class RepoController extends GetxController {
  var repoGet = <GetRepositoryModel>[].obs;
 
  var isLoading = true.obs;
  final getRepoService = RepositoryService();
  @override
  void onInit() {
    getRepository();
    super.onInit();
  }

  void getRepository() async {
    try {
      isLoading(true);
      var authRepo = await getRepoService.getRepository();

      if (authRepo != null) {
        repoGet.value = authRepo;
      }
    } finally {
      isLoading(false);
    }
  }
}
