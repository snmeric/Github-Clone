import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_projeleri/const.dart';
import 'package:flutter_projeleri/home/home_controller.dart';
import 'package:flutter_projeleri/settings/kisisel_bilgiler.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final HomeController c = HomeController();
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          'Ayarlar',
          style: regular18WhiteText,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => KisiselBilgiler());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Kullanıcı Bilgileri',
                    style: regular15WhiteText,
                  ),
                  Icon(
                    Iconsax.arrow_right,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                width: 150,
                child: NeumorphicButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    print("Çıkış Yapıldı..");
                    c.logout();
                  },
                  padding: EdgeInsets.all(10),
                  style: NeumorphicStyle(
                    color: myPrimaryColor,
                    shadowDarkColor: myPrimaryColor,
                    shadowLightColor: myPrimaryColor,
                    depth: 7,
                    intensity: 0.4,
                    shape: NeumorphicShape.flat,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
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
      ),
    );
  }
}
