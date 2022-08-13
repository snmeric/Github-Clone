import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_projeleri/const.dart';
import 'package:flutter_projeleri/controllers/repo_controller.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class AllRepositories extends StatefulWidget {
  const AllRepositories({super.key});

  @override
  State<AllRepositories> createState() => _AllRepositoriesState();
}

class _AllRepositoriesState extends State<AllRepositories> {
//* -----START----- RIVE CONTROLLER -----START-----

//*-----END----- RIVE CONTROLLER -----END-----
  @override
  Widget build(BuildContext context) {
    final RepoController r = Get.put(RepoController());
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          'Repositories',
          style: regular18WhiteText,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Obx(() {
         if (r.isLoading.value) {
                return SizedBox(
                    height: MediaQuery.of(context).size.height / 1.3,
                    child: const Center(child: CircularProgressIndicator()));
              }
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(25),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: r.repoGet.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: bgSecondaryColor,
                            ),
                            padding: EdgeInsets.all(15),
                            child: Center(
                              child: Text(
                                "${r.repoGet.value[index].name}",
                                style: regular15WhiteText,
                              ),
                            )),
                      );
                    }),
              ),
            ],
          ),
        );
      }),
    );
  }
}
