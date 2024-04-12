import 'package:demo/values/app_assets.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            // IconButton(
            //   onPressed: () {},
            //   icon: Image.asset(AppAssets.favorite1),
            // ),
            Container(
              height: 35,
              width: 35,
              child: InkWell(
                onTap: () {},
                child: Image.asset(AppAssets.favorite1),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset(AppAssets.notification),
              // tooltip: 'Notification',
            )
          ],
          title: InkWell(
            onTap: () {},
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: const Color.fromARGB(137, 80, 79, 79)),
                  borderRadius: BorderRadius.circular(3)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(AppAssets.search16x),
                  ),
                  Text(
                    'Search result',
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  )
                ],
              ),
            ),
          )),
      body: Center(
        child: Column(
          children: [Text('data')],
        ),
      ),
    );
  }
}
