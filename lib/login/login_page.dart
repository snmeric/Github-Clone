import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projeleri/firebase_auth/secret_keys.dart' as SecretKey;
import 'package:flutter_projeleri/login/github_signin.dart';
import 'package:get_storage/get_storage.dart';
import 'package:github_sign_in/github_sign_in.dart';
import 'package:grock/grock.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_projeleri/const.dart';
import 'package:flutter_projeleri/widgets/giris_yap_butonu.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    final box = GetStorage();

    return Scaffold(
            backgroundColor: bgColor,
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                   
                      Image.asset(
                        'assets/images/github_logo.png',
                        color: Colors.white,
                        height: 160,
                      ),
                     
                      
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 330,
                        child: GirisYapButton(),
                      )
                    ]),
              ),
            ),
          );
  }
}

/*

SizedBox(
                          width: 340,
                          child: TextField(
                            style: regular15WhiteText,
                            cursorColor: greyTextColor,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              filled: true, //<-- SEE HERE
                              fillColor: bgSecondaryColor,
                              hintText: 'E-postanızı giriniz..',
                              hintStyle: TextStyle(color: Colors.grey),
                              labelText: 'Email',
                              labelStyle: regular15WhiteText,
                              prefixIcon: Icon(
                                Iconsax.user,
                                color: Colors.white,
                                size: 20,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              floatingLabelStyle: TextStyle(
                                  color: greyTextColor,
                                  fontSize: 18), // TextStyle
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 1.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 340,
                          child: TextField(
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            style: regular15WhiteText,
                            cursorColor: greyTextColor,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              filled: true, //<-- SEE HERE
                              fillColor: bgSecondaryColor,
                              hintText: 'Şifrenizi giriniz..',
                              hintStyle: TextStyle(color: Colors.grey),
                              labelText: 'Şifre',
                              labelStyle: regular15WhiteText,
                              prefixIcon: Icon(
                                Iconsax.key,
                                color: Colors.white,
                                size: 20,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              floatingLabelStyle: TextStyle(
                                  color: greyTextColor,
                                  fontSize: 18), // TextStyle
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 1.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),


*/