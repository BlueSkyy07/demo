import 'package:demo/auth/authpage.dart';
import 'package:demo/controller/controllerlogin.dart';
import 'package:demo/pages/myhomepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ControllerLogin checkLogin = Get.put(ControllerLogin());

    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            checkLogin.userEmail.value =
                FirebaseAuth.instance.currentUser!.email!;
            checkLogin.displayName.value =
                FirebaseAuth.instance.currentUser!.displayName ?? "";
            checkLogin.loginSuccess();
            return MyHomePage();
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}
