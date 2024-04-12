import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/auth/mainpage.dart';
import 'package:demo/values/app_assets.dart';
import 'package:demo/widgets/textfieldlogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final _fullnameController = TextEditingController();
    final _passwordController = TextEditingController();
    final _emailController = TextEditingController();
    final _mobileController = TextEditingController();

    Future<void> addUserToFirestore(
        String fullname, String phone, String email) async {
      try {
        await FirebaseFirestore.instance.collection('users').add({
          'email': email,
          'fullname': fullname,
          'phone': phone,
        });
        print('User added to Firestore successfully!');
      } catch (e) {
        print('Error adding user to Firestore: $e');
      }
    }

    Future<void> signUp() async {
      String fullname = _fullnameController.text.trim();
      String phone = _mobileController.text.trim();
      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();

      // Kiểm tra mật khẩu có đủ 8 ký tự không
      if (password.length < 8) {
        print('Mật khẩu phải chứa ít nhất 8 ký tự!');
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Error"),
            content: Text("Mật khẩu phải chứa ít nhất 8 ký tự!"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          ),
        );
        return;
      }

      // Kiểm tra email đã tồn tại trong cơ sở dữ liệu chưa
      QuerySnapshot<Map<String, dynamic>> existingUsers =
          await FirebaseFirestore.instance
              .collection('users')
              .where('email', isEqualTo: email)
              .get();
      if (existingUsers.docs.isNotEmpty) {
        print('Email đã tồn tại!');
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Error"),
            content: Text("Email đã tồn tại!"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          ),
        );
        return;
      }

      // Nếu mật khẩu đủ 8 ký tự và email chưa tồn tại trong cơ sở dữ liệu, thực hiện đăng ký
      if (fullname.isNotEmpty &&
          phone.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty) {
        await addUserToFirestore(fullname, phone, email);

        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
      } else {
        print('Vui lòng điền đầy đủ thông tin!');
      }
      // Get.off(() => MainPage());
      // showDialog(
      //   context: context,
      //   builder: (context) => AlertDialog(
      //     title: Text("Notification!!"),
      //     content: Text("Thêm tài khoản thành công!"),
      //     actions: [
      //       TextButton(
      //         onPressed: () {
      //           Get.offAll(() => MainPage());
      //           return;
      //         },
      //         child: Text("OK"),
      //       ),
      //     ],
      //   ),
      // );
    }

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Image.asset(AppAssets.backgroundReg),
          ),
          Positioned(
            bottom: 0,
            child: Image.asset(AppAssets.backgroundReg2),
          ),
          Positioned(
              top: 20,
              child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Image.asset(AppAssets.vectorback))),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    child: Text(
                      "Create account",
                      style:
                          TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  buildTextFieldLogin(
                      controller: _fullnameController,
                      hintText: "Fullname",
                      prefixIcon: Image.asset(AppAssets.profile)),
                  SizedBox(
                    height: 40,
                  ),
                  buildTextFieldLogin(
                      controller: _passwordController,
                      obscureText: true,
                      hintText: "Password",
                      prefixIcon: Image.asset(AppAssets.password)),
                  SizedBox(
                    height: 40,
                  ),
                  buildTextFieldLogin(
                      controller: _emailController,
                      hintText: "Email",
                      prefixIcon: Image.asset(AppAssets.email)),
                  SizedBox(
                    height: 40,
                  ),
                  buildTextFieldLogin(
                      controller: _mobileController,
                      hintText: "Mobile",
                      prefixIcon: Image.asset(AppAssets.phone)),
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Create',
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
                            onTap: () {
                              signUp();
                              return;
                            },
                            child: Image.asset(AppAssets.vector),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'I am a member',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: widget.showLoginPage,
                        child: Text(
                          ' Login now',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
