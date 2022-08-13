import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_projeleri/const.dart';
import 'package:flutter_projeleri/home/home_controller.dart';
import 'package:flutter_projeleri/login/github_signin.dart';
import 'package:flutter_projeleri/login/login_controller.dart';
import 'package:flutter_projeleri/login/login_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grock/grock.dart';

class GirisYapButton extends StatefulWidget {
  const GirisYapButton({Key? key}) : super(key: key);

  @override
  State<GirisYapButton> createState() => _GirisYapButtonState();
}

class _GirisYapButtonState extends State<GirisYapButton> {
  bool isLoading = false;
  final LoginController c = LoginController();
  final HomeController d = HomeController();
  @override
  Widget build(BuildContext context) {
    return !isLoading
        ? NeumorphicButton(
            onPressed: () async {
              setState(() {
                isLoading = true;
              });
              FirebaseService firebaseService = FirebaseService();

              try {
                var sonuc = await firebaseService.gitHubSignIn(context);
                if (sonuc != null) {
                  c.login();
                }
              } on FirebaseAuthException catch (e) {
                print("HATA!!: ${e.message}");

                Grock.snackBar(
                    title: 'Hata',
                    description: "Giriş yaparken bir sorun oluştu.");
              }
              setState(() {
                isLoading = false;
              });
            },
            //   if (box.read('token') != null) {
            //     c.login();
            //     Grock.snackBar(
            //         title: 'Başarılı',
            //         description:
            //             'Başarılı bir şekilde giriş yaptınız.');
            //   } else {
            //     Grock.snackBar(
            //         title: 'Hata!',
            //         description: 'Bir yerde hata var..');
            //     LoginPage();
            //   }

            padding: const EdgeInsets.all(10),
            style: NeumorphicStyle(
              color: myPrimaryColor,
              shadowDarkColor: myPrimaryColor,
              shadowLightColor: myPrimaryColor,
              depth: 7,
              intensity: 0.4,
              shape: NeumorphicShape.flat,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/github_logo.png',
                    width: 30,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Center(
                  child: Text(
                    'Github ile giriş yap',
                    style: regular15WhiteBoldText,
                  ),
                ),
              ],
            ),
          )
        : Container(
            child: const Center(child: CircularProgressIndicator()),
          );
  }
}

/*

class CustomButton extends StatelessWidget {
  final double buttonPadding;
  final String? buttonText;
  final Widget? child;
  final IconData? buttonIcon;
  final String? press;

  const CustomButton(
      {Key? key,
      required this.buttonPadding,
      this.buttonText,
      this.child,
      this.buttonIcon,
      this.press,
     
    
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
  

    return SizedBox(
      width: 330,
      child: NeumorphicButton(
       onPressed: () {
          
       },
          padding: EdgeInsets.all(buttonPadding),
          style: NeumorphicStyle(
            
            color: myPrimaryColor,
            shadowDarkColor:myPrimaryColor,
            shadowLightColor: myPrimaryColor,
            depth: 7,
            intensity: 0.4,
            shape: NeumorphicShape.flat,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
          ),
          child: Center(
            child: buttonText.toString().isEmpty
                ? Icon(
                    buttonIcon,
                    color: Colors.white,
                  )
                : Text(
                    buttonText.toString(),
                    style: regular15WhiteBoldText,
                  ),
          )),
    );
  }
}
*/