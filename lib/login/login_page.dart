import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rive/rive.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_projeleri/const.dart';
import 'package:flutter_projeleri/widgets/giris_yap_butonu.dart';


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


    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Stack(
          children: [
            const RiveAnimation.asset(
              'assets/rive/space_coffee.riv',
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:const [
                      // Image.asset(
                      //   'assets/images/github_logo.png',
                      //   color: Colors.white,
                      //   height: 160,
                      // ),

                       SizedBox(
                        width: 330,
                        child: GirisYapButton(),
                      ),
                    ]),
              ),
            ),
          ],
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