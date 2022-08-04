import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'package:flutter_projeleri/const.dart';
import 'package:flutter_projeleri/controllers/databindings.dart';
import 'package:flutter_projeleri/controllers/user_control.dart';
import 'package:flutter_projeleri/home/home_controller.dart';
import 'package:flutter_projeleri/home/settings.dart';
import 'package:flutter_projeleri/login/login_page.dart';
import 'package:flutter_projeleri/services/service.dart';
import 'package:flutter_projeleri/widgets/giris_yap_butonu.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            return Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 65,
                          width: 65,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(150),
                              child: Image.network(
                                "${u.userGet.value.avatarUrl}",
                                fit: BoxFit.cover,
                              )),
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
                        IconButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onPressed: () {
                            Get.to(() => SettingsPage());
                          },
                          icon: const Icon(
                            Iconsax.setting_2,
                          ),
                          color: mySecondaryColor,
                        )
                      ]),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
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
                                print("Tıklandı..");
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                    height: 120,
                  ),
                  
                  Center(
                    child: SizedBox(
                      width: 330,
                      child: NeumorphicButton(
                        onPressed: () async {
                          
                          print("Çıkış Yapıldı..");
                         
                        },
                        padding: EdgeInsets.all(10),
                        style: NeumorphicStyle(
                          color:myPrimaryColor,
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
                    ),
                  ),
                    ],
                  ),
                  
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
