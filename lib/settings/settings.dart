import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_projeleri/const.dart';
import 'package:flutter_projeleri/home/home_controller.dart';
import 'package:flutter_projeleri/settings/repository.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/user_control.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final UserController c = Get.find();
    final HomeController d = HomeController();
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          title: Text(
            'Profil',
            style: regular18WhiteText,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Container(
                height: 130,
                width: 130,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(150),
                    child: Image.network(
                      "${c.userGet.value.avatarUrl}",
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
              Text('${c.userGet.value.login}', style: big23WhiteText),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        final url = Uri.parse(
                            'https://github.com/${c.userGet.value.login}?tab=following');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        }
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: bgSecondaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Takip Ettiklerim',
                              style: regular16WhiteBoldText,
                              textAlign: TextAlign.center,
                            ),
                            Text('${c.userGet.value.following}',
                                style: big23WhiteText),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        final url = Uri.parse(
                            'https://github.com/${c.userGet.value.login}?tab=followers');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height * 0.15,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: bgSecondaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Takipçiler',
                              style: regular16WhiteBoldText,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              '${c.userGet.value.followers}',
                              style: big23WhiteText,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        final url = Uri.parse(
                            'https://github.com/${c.userGet.value.login}?tab=repositories');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        }
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.22,
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: bgSecondaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Herkese Açık Repository',
                              style: regular16WhiteBoldText,
                              textAlign: TextAlign.center,
                            ),
                            Text('${c.userGet.value.publicRepos}',
                                style: big23WhiteText),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => const AllRepositories(),
                            transition: Transition.zoom);
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.22,
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: bgSecondaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Tüm Repository',
                              style: regular16WhiteBoldText,
                              textAlign: TextAlign.center,
                            ),
                            Text('${c.userGet.value.ownedPrivateRepos}',
                                style: big23WhiteText),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  width: 150,
                  child: NeumorphicButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      //print("Çıkış Yapıldı..");
                      d.logout();
                    },
                    padding: EdgeInsets.all(10),
                    style: NeumorphicStyle(
                      color: myPrimaryColor,
                      shadowDarkColor: myPrimaryColor,
                      shadowLightColor: myPrimaryColor,
                      depth: 7,
                      intensity: 0.4,
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(8)),
                    ),
                    child: Center(
                      child: Text(
                        'Çıkış Yap',
                        style: regular15WhiteBoldText,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
