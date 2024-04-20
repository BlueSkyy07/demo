import 'package:demo/values/app_assets.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              height: 200,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        // Do something when the icon is tapped
                        items[index].onTap();
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            width: 50, // Đặt kích thước hình tròn
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 1, color: Colors.black26),
                              // boxShadow: [
                              //   BoxShadow(
                              //     offset: Offset(2, 4),
                              //     color: Colors.black12,
                              //     blurRadius: 2,
                              //   ),
                              // ],
                            ),
                            child: Image.asset(
                              items[index].icon,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(items[index].name),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListItem {
  final String name;
  final String icon;
  VoidCallback onTap;
  ListItem({required this.name, required this.icon, required this.onTap});
}

List<ListItem> items = [
  ListItem(
    name: 'Item 1',
    icon: AppAssets.email,
    onTap: () {},
  ),
  ListItem(
      name: 'Item 2',
      icon: AppAssets.detail,
      onTap: () {
        print('Icon 2 tapped.');
      }),
  ListItem(
      name: 'Item 3',
      icon: AppAssets.home,
      onTap: () {
        print('Icon 2 tapped.');
      }),
  ListItem(
      name: 'Item 4',
      icon: AppAssets.payment,
      onTap: () {
        print('Icon 2 tapped.');
      }),
  ListItem(
      name: 'Item 5',
      icon: AppAssets.payment,
      onTap: () {
        print('Icon 2 tapped.');
      }),
  ListItem(
      name: 'Item 6',
      icon: AppAssets.payment,
      onTap: () {
        print('Icon 2 tapped.');
      }),
  ListItem(
      name: 'Item 7',
      icon: AppAssets.payment,
      onTap: () {
        print('Icon 2 tapped.');
      }),
  ListItem(
      name: 'Item 8',
      icon: AppAssets.payment,
      onTap: () {
        print('Icon 2 tapped.');
      }),
];
