import 'package:demo/pages/myhomepage.dart';
import 'package:demo/values/app_assets.dart';
import 'package:demo/widgets/attributeProfile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountProfilePage extends StatefulWidget {
  const AccountProfilePage({super.key});

  @override
  State<AccountProfilePage> createState() => _AccountProfilePageState();
}

class _AccountProfilePageState extends State<AccountProfilePage> {
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
                      Container(
                        child: Text(
                          "Phạm Minh Thái",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Container(
                        child: Text("@livetroll"),
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
              onTap: goToNextPage,
            )
          ],
        ),
      ),
    );
  }
}

void goToNextPage() {
  Get.to(MyHomePage()); // Sử dụng GetX để điều hướng tới NextPage()
}
