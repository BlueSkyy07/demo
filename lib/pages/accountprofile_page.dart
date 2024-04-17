import 'package:demo/auth/mainpage.dart';
import 'package:demo/controller/controllerlogin.dart';
import 'package:demo/pages/myhomepage.dart';
import 'package:demo/values/app_assets.dart';
import 'package:demo/widgets/attributeProfile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountProfilePage extends StatefulWidget {
  const AccountProfilePage({super.key});

  @override
  State<AccountProfilePage> createState() => _AccountProfilePageState();
}

class _AccountProfilePageState extends State<AccountProfilePage> {
  // final user = FirebaseAuth.instance.currentUser!;
  // int i = 1;
  // final ControllerLogin user = Get.find();
  final ControllerLogin user = Get.put(ControllerLogin());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Profile'),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Image.asset(AppAssets.back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    child: CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(
                          'https://static.wikia.nocookie.net/naruto/images/b/bb/Itachi.png/revision/latest/scale-to-width-down/300?cb=20220214112531'),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      if (user.displayName.value != '') ...[
                        Container(
                          child: Text(
                            user.displayName.value,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        )
                      ] else ...[
                        Container(
                          child: Text(
                            user.userEmail.value,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                      Container(
                        child: Text(
                          "@livetroll",
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                            height: 20,
                            width: 20,
                            child: Image.asset(AppAssets.sex)),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Gender",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          "Male",
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset(AppAssets.next)
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            AttributeProfile(
              icon: AppAssets.calendar,
              attribute: "Birth Day",
              data: "27/07/2002",
              onTap: goToNextPage,
            ),
            SizedBox(
              height: 20,
            ),
            AttributeProfile(
              icon: AppAssets.email1,
              attribute: "Email",
              data: "thaipham27072002@gmai.com",
              onTap: goToNextPage,
            ),
            SizedBox(
              height: 20,
            ),
            AttributeProfile(
              icon: AppAssets.phone1,
              attribute: "Phone",
              data: "0972084822",
              onTap: goToNextPage,
            ),
            SizedBox(
              height: 20,
            ),
            AttributeProfile(
              icon: AppAssets.lock,
              attribute: "Change password",
              data: "*********",
              onTap: test,
            ),
            TextButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Get.offAll(MainPage());
                  return;
                },
                child: Text("Logout"))
          ],
        ),
      ),
    );
  }
}

void goToNextPage() {
  Get.to(MyHomePage()); // Sử dụng GetX để điều hướng tới NextPage()
}

void test() {
  Get.dialog(
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Material(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      "Title Text",
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Message Text",
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    //Buttons
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            child: const Text(
                              'NO',
                            ),
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            child: const Text(
                              'YES',
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
