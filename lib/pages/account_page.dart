import 'package:demo/pages/accountprofile_page.dart';
import 'package:demo/pages/myhomepage.dart';
import 'package:demo/values/app_assets.dart';
import 'package:demo/widgets/attributeProfile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              AttributeAccount(
                  icon: AppAssets.user, text: "Profile", onTap: goToProfile),
              SizedBox(
                height: 10,
              ),
              AttributeAccount(
                  icon: AppAssets.order, text: "Order", onTap: goToNextPage),
              SizedBox(
                height: 10,
              ),
              AttributeAccount(
                  icon: AppAssets.location,
                  text: "Address",
                  onTap: goToNextPage),
              SizedBox(
                height: 10,
              ),
              AttributeAccount(
                  icon: AppAssets.payment, text: "Payment", onTap: goToNextPage)
            ],
          ),
        ),
      ),
    );
  }
}

void goToNextPage() {
  Get.to(MyHomePage()); // Sử dụng GetX để điều hướng tới NextPage()
}

void goToProfile() {
  Get.to(AccountProfilePage());
}
