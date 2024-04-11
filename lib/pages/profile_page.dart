import 'package:demo/values/app_assets.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text('hêlo'),
            ),
            Container(
              child: Image.asset(AppAssets.user),
            )
          ],
        ),
      ),
    );
  }
}
