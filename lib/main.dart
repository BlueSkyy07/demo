import 'dart:io';

import 'package:demo/pages/account_page.dart';
import 'package:demo/pages/login.dart';
import 'package:demo/pages/mainpage.dart';
import 'package:demo/pages/myhomepage.dart';
import 'package:demo/pages/accountprofile_page.dart';
import 'package:demo/pages/registerpage.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: FirebaseOptions(
              apiKey: "AIzaSyD_pdvPn6sNsl-JEe9FNiveBX8xjMx4Quo",
              appId: "1:395210282146:android:e262f684b4a759eb03f3fb",
              messagingSenderId: "395210282146",
              projectId: "appstore-4a1f5",
              storageBucket: "gs://appstore-4a1f5.appspot.com"))
      : await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
