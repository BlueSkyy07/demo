import 'package:demo/pages/login.dart';
import 'package:demo/pages/registerpage.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  void changeState() {
    if (mounted) {
      setState(() {
        showLoginPage = !showLoginPage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(showRegisterPage: changeState);
    } else {
      return RegisterPage(showLoginPage: changeState);
    }
  }
}
