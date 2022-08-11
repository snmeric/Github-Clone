import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_projeleri/const.dart';
import 'package:flutter_projeleri/controllers/repo_controller.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class KisiselBilgiler extends StatefulWidget {
  const KisiselBilgiler({super.key});

  @override
  State<KisiselBilgiler> createState() => _KisiselBilgilerState();
}

class _KisiselBilgilerState extends State<KisiselBilgiler> {
//* -----START----- RIVE CONTROLLER -----START-----

  bool _isSwitch = false;
  StateMachineController? stateMachineController;
  Artboard? _riveArtboard;
  SMIInput<bool>? isPressed;
  bool get isPlaying => stateMachineController?.isActive ?? false;
  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/rive/switch_summer_demo.riv').then(
      (data) {
        // Load the RiveFile from the binary data.
        final file = RiveFile.import(data);

        final artboard = file.mainArtboard;
        stateMachineController =
            StateMachineController.fromArtboard(artboard, "State Machine 1");

        if (stateMachineController != null) {
          isPressed = stateMachineController?.findInput('isPressed');
          isPressed!.value = _isSwitch;
          artboard.addController(stateMachineController!);
        }
        setState(() => {
              _riveArtboard = artboard,
            });
      },
    );
  }

  void changePage() async {
    setState(() {
      debugPrint(_isSwitch.toString());
      _isSwitch = !_isSwitch;
      isPressed!.value = !isPressed!.value;
    });
  }

//*-----END----- RIVE CONTROLLER -----END-----
  @override
  Widget build(BuildContext context) {
    final RepoController r = Get.put(RepoController());
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          'Kişisel Bilgiler',
          style: regular18WhiteText,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: r.repoGet.length,
          itemBuilder: (context, index) {
            // r.repoGet.value.map<String>((e) => Container(
            //       child: Text(e),
            //     ));

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
    );
  }
}
