import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_projeleri/%C4%B1ssues/issue_list_view.dart';
import 'package:flutter_projeleri/const.dart';
import 'package:flutter_projeleri/controllers/repo_controller.dart';
import 'package:flutter_projeleri/controllers/user_control.dart';
import 'package:flutter_projeleri/home/home_controller.dart';
import 'package:flutter_projeleri/model/get_list_issue.dart';
import 'package:flutter_projeleri/settings/settings.dart';
import 'package:flutter_projeleri/services/service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grock/grock.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rive/rive.dart';

import '../ıssues/ıssues_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late RiveAnimationController _riveControl;
  bool isPlay = false;
  bool isSwitch = false;
  bool isLoading = false;

//* -----START----- RIVE CONTROLLER -----START-----

  bool _isSwitch = false;
  StateMachineController? stateMachineController;
  Artboard? _riveArtboard;
  SMIInput<bool>? isPressed;
  bool get isPlaying => stateMachineController?.isActive ?? false;

//*-----END----- RIVE CONTROLLER -----END-----

  AnimationController? _controller;
  Animation<double>? _animation;
  bool isSelected = false;
  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    _animation = CurvedAnimation(parent: _controller!, curve: Curves.easeIn);
    _controller!.forward();

    _riveControl = OneShotAnimation(
      'Animation 1',
      autoplay: false,
      onStop: () => setState(() => isPlay = false),
      onStart: () => setState(() => isPlay = true),
    );
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

  //*RIVE
  void changePage() async {
    setState(() {
      //debugPrint(_isSwitch.toString());
      _isSwitch = !_isSwitch;
      isPressed!.value = !isPressed!.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final HomeController c = HomeController();
    final service = Service();
    final UserController u = Get.put(UserController());

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Obx(
          () {
            if (u.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: FadeTransition(
                    opacity: _animation!,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GrockFadeAnimation(
                            opacityDuration: const Duration(milliseconds: 500),
                            duration: const Duration(milliseconds: 500),
                            initialLocation: InitialLocation.left,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => SettingsPage(),
                                        transition: Transition.zoom);
                                  },
                                  child: Container(
                                    height: 65,
                                    width: 65,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: mySecondaryColor,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white30,
                                          blurRadius: 25.0,
                                          spreadRadius: 1,
                                          offset: Offset(
                                            2,
                                            6,
                                          ),
                                        )
                                      ],
                                    ),
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(150),
                                        child: Image.network(
                                          "${u.userGet.value.avatarUrl}",
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Hoşgeldin',
                                      style: regular15WhiteText,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '${u.userGet.value.login}',
                                      style: big18WhiteText,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              GrockFadeAnimation(
                                opacityDuration:
                                    const Duration(milliseconds: 500),
                                duration: const Duration(milliseconds: 500),
                                initialLocation: InitialLocation.bottom,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Oluştur/Görüntüle',
                                        style: regular15GreyText,
                                      ),
                                      SizedBox(
                                        height: 70,
                                        child: _riveArtboard == null
                                            ? const SizedBox()
                                            : Center(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    changePage();
                                                  },
                                                  child: Rive(
                                                      artboard: _riveArtboard!),
                                                ),
                                              ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              _isSwitch == false
                                  ? GrockFadeAnimation(
                                      opacityDuration:
                                          const Duration(milliseconds: 500),
                                      duration: const Duration(milliseconds: 500),
                                      initialLocation: InitialLocation.bottom,
                                      child: const IssueOlustur())
                                  : const IssueGoruntule()
                            ],
                          ),
                        ])),
              ),
            );
          },
        ),
      ),
    );
  }
}

class IssueOlustur extends StatelessWidget {
  const IssueOlustur({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Iconsax.info_circle,
          color: Colors.white,
          size: 50,
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: SizedBox(
            height: 80,
            width: 300.0,
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 30.0,
                fontFamily: 'Agne',
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText('Issues’a Hoşgeldiniz!',
                      textAlign: TextAlign.center,
                      textStyle: regular15WhiteText,
                      speed: const Duration(milliseconds: 100),
                      cursor: ''),
                  TypewriterAnimatedText(
                      'Issues yani sorunlar, yapılacak işleri, hataları,özellik isteklerini ve daha fazlasını izlemek için kullanılır.',
                      textAlign: TextAlign.center,
                      textStyle: regular15GreyText,
                      speed: const Duration(milliseconds: 100)),
                  TypewriterAnimatedText(
                      'Başlamak için bir sorun oluşturmalısınız.',
                      textAlign: TextAlign.center,
                      textStyle: regular15GreyText,
                      speed: const Duration(milliseconds: 120)),
                ],
                onTap: () {
                  Get.to(() => IssuesPage(), transition: Transition.fadeIn);
                },
              ),
            ),
          ),
        ),
        // SizedBox(
        //   height: 120,
        // ),
        // ChoiceChip(
        //   label: const Text('bug'),
        //   selected: isSelected,
        //   onSelected: (newBoolValue) {
        //     setState(() {
        //       isSelected = newBoolValue;
        //     });
        //   },
        // ),
        const SizedBox(
          height: 5,
        ),
        GestureDetector(
          onTap: (() {
            Get.to(() => IssuesPage());
          }),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Text(
                'Başlamak için tıkla..',
                style: regular15GreyText,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 250,
                child: RiveAnimation.asset(
                  'assets/rive/rocket_demo.riv',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),

        // Center(
        //   child: SizedBox(
        //     width: 330,
        //     child: NeumorphicButton(
        //       onPressed: () async {
        //         Get.to(() => IssuesPage(),
        //             transition: Transition.zoom);
        //       },
        //       padding: EdgeInsets.all(10),
        //       style: NeumorphicStyle(
        //         color: myPrimaryColor,
        //         shadowDarkColor: myPrimaryColor,
        //         shadowLightColor: myPrimaryColor,
        //         depth: 8,
        //         intensity: 0.5,
        //         shape: NeumorphicShape.convex,
        //         boxShape: NeumorphicBoxShape.roundRect(
        //             BorderRadius.circular(12)),
        //       ),
        //       child: Center(
        //         child: Text(
        //           'Oluştur',
        //           style: regular15WhiteBoldText,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

class IssueGoruntule extends StatelessWidget {
  const IssueGoruntule({super.key});

  void onInit() {}

  @override
  Widget build(BuildContext context) {
    final GetListIssiueModel gi = Get.put(GetListIssiueModel());
    final box = GetStorage();
    bool titleValidate(String repo) {
      if (repo.isEmpty) {
        return false;
      } else {
        return true;
      }
    }

    final RepoController r = Get.put(RepoController());

    final _repos = TextEditingController();
    return GrockFadeAnimation(
      opacityDuration: const Duration(milliseconds: 500),
      duration: const Duration(milliseconds: 500),
      initialLocation: InitialLocation.bottom,
      child: Column(
        children: [
          Center(
            child: Obx(
              () => CustomDropdown(
                selectedStyle: const TextStyle(color: Colors.blueAccent),
                fillColor: bgSecondaryColor,
                listItemStyle: const TextStyle(
                  color: bgSecondaryColor,
                ),
                hintText: 'Repository seçin.. *',
                // ignore: invalid_use_of_protected_member
                items:
                    r.repoGet.value.map<String>((e) => e.name!).toList().isEmpty
                        ? ['Yükleniyor..']
                        // ignore: invalid_use_of_protected_member
                        : r.repoGet.value.map<String>((e) => e.name!).toList(),
                controller: _repos,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          NeumorphicButton(
            onPressed: () async {
              if (titleValidate(_repos.text) == true) {
                Get.to(() => IssueListView(
                      repCont: _repos,
                    ));
              } else {
                Grock.snackBar(
                    title: 'Dikkat',
                    description: 'Lütfen Repositoryi seçtiğinizden emin olun.');
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
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
            ),
            child: Center(
              child: Text(
                'Görüntüle',
                style: regular15WhiteBoldText,
              ),
            ),
          )
        ],
      ),
    );
  }
}
