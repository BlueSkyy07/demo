import 'package:demo/pages/account_page.dart';
import 'package:demo/pages/cartpage.dart';
import 'package:demo/pages/login.dart';
import 'package:demo/pages/searchpage.dart';
import 'package:demo/values/app_assets.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  Widget _account = AccountPage();
  Widget _home = SearchPage();
  Widget _cart = CartPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: this.selectedIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.contact_emergency_outlined), label: 'contact'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box_sharp), label: 'account'),
          ],
          onTap: (int index) {
            this.onTapHandler(index);
          },
        ),
        body: this.getBody());
  }

  void onTapHandler(int index) {
    this.setState(() {
      this.selectedIndex = index;
    });
  }

  Widget getBody() {
    if (this.selectedIndex == 0) {
      return this._home;
    } else if (this.selectedIndex == 1) {
      return this._cart;
    } else {
      return this._account;
    }
  }
}
