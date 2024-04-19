import 'package:demo/controller/controllerlogin.dart';
import 'package:demo/pages/registerpage.dart';
import 'package:demo/widgets/textfieldlogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:demo/values/app_assets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final ControllerLogin showPass = Get.put(ControllerLogin());

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // Get.defaultDialog(
        //   title: "GeeksforGeeks",
        //   middleText: "Hello world!",
        //   backgroundColor: Colors.green,
        //   titleStyle: TextStyle(color: Colors.white),
        //   middleTextStyle: TextStyle(color: Colors.white),
        // );
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Error"),
            content: Text("Invalid email or password. Please try again."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Đóng dialog
                },
                child: Text("OK"),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    showPass.showPassword.value = false;
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned(
            top: 0,
            child: Image.asset(
              AppAssets.backgroundLogin1,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Image.asset(
              AppAssets.backgroundLogin2,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Container(
                    // height: size.height * 2 / 7,
                    child: Text(
                      'Hello',
                      style:
                          TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    // height: size.height * 1 / 8,
                    child: Text(
                      'Sign in to your account',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  buildTextFieldLogin(
                    controller: _emailController,
                    hintText: "Email",
                    prefixIcon:
                        Image.asset(AppAssets.email, height: 22, width: 26),
                    suffixIcon: null,
                  ),
                  SizedBox(height: 40),
                  Obx(() => buildTextFieldLogin(
                        controller: _passwordController,
                        obscureText: !showPass.showPassword.value,
                        hintText: "Password",
                        prefixIcon: Image.asset(
                          AppAssets.password,
                          height: 22,
                          width: 26,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            showPass.showPassword.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            showPass.ShowTextPssword();
                          },
                        ),
                      )),
                  SizedBox(height: 20),
                  Container(
                    height: 50,
                    alignment: Alignment.centerRight, // Align text to the right
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot your password?',
                        style: TextStyle(color: Colors.black38),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Sign in',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 34,
                          width: 56,
                          decoration: BoxDecoration(
                              // color: const Color.fromRGBO(249, 119, 147, 5),
                              gradient: LinearGradient(colors: [
                                Color(0xFFE45171),
                                Color.fromARGB(255, 148, 33, 224),
                              ]),
                              borderRadius: BorderRadius.circular(24)),
                          child: InkWell(
                            onTap: signIn,
                            child: Image.asset(AppAssets.vector),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text("Don't have an account? "),
                        TextButton(
                          onPressed: () {
                            widget.showRegisterPage();
                          },
                          child: Text(
                            'Create',
                            style: TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
