import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'package:flutter_projeleri/const.dart';
import 'package:flutter_projeleri/home/home_controller.dart';
import 'package:flutter_projeleri/login/login_page.dart';
import 'package:flutter_projeleri/widgets/giris_yap_butonu.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final HomeController c=HomeController();
     
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             SizedBox(
                  width: 330,
                  child: NeumorphicButton(
                      onPressed: ()async {
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
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(8)),
                      ),
                      child: Center(
                        child: Text(
                          'Çıkış Yap',
                          style: regular15WhiteBoldText,
                        ),
                      )),
                ),
          ],
        ),
      ),
    );
  }
}
