import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_projeleri/firebase_auth/secret_keys.dart';
import 'package:get_storage/get_storage.dart';
import 'package:github_sign_in/github_sign_in.dart';
import 'package:grock/grock.dart';

class FirebaseService {
  final box = GetStorage();
  String clientId = GITHUB_CLIENT_ID;
  String clientSecret = GITHUB_CLIENT_SECRET;
  String redirectUrl =
      "https://issuepost-35f3d.firebaseapp.com/__/auth/handler";

  Future<UserCredential?> gitHubSignIn(context) async {
    final GitHubSignIn github = GitHubSignIn(
        allowSignUp: false,
        scope: "user,gist,admin:repo_hook,repo,admin:enterprise",
        clientId: clientId,
        clientSecret: clientSecret,
        redirectUrl: redirectUrl,
        title: 'Github ile giriş yap',
        centerTitle: true);

    final result = await github.signIn(context);
    if (result.token == null &&
        result.status == GitHubSignInResultStatus.cancelled) {
      Grock.snackBar(title: 'Başarısız', description: 'Giriş Başarısız!');
      box.erase();
      
      
      return null;
    } else if (result.token != null &&
        result.status == GitHubSignInResultStatus.ok) {
      final githubCreden = GithubAuthProvider.credential(result.token!);
      box.write('token', result.token);
      log("Kaydedilen Token: ${box.read('token')}");
      return await FirebaseAuth.instance.signInWithCredential(githubCreden);
    } else {
      Grock.snackBar(title: 'Başarısız', description: 'Giriş Başarısız!');
      return null;
    }
    
  }
}
