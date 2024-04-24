import 'package:demo/controller/product_controller.dart';
import 'package:demo/model/post.dart';
import 'package:demo/model/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:demo/network/network_request.dart';
import 'dart:convert';

class TestPage extends StatefulWidget {
  TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final ProductController product = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            // Expanded(
            //   child: GridView.builder(
            //     padding: EdgeInsets.all(10),
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 2,
            //         crossAxisSpacing: 4.0,
            //         mainAxisSpacing: 4.0,
            //         mainAxisExtent: 250),
            //     shrinkWrap: true, // Thêm thuộc tính shrinkWrap
            //     itemCount: postData.length,
            //     itemBuilder: (context, index) {
            //       return Card(
            //         // padding: EdgeInsets.all(10),
            //         child: Column(
            //           children: [
            //             ElevatedButton(onPressed: () {}, child: Text('click'))
            //             // Image.network('${postData[index].image}'),
            //             // Text('${postData[index].title}'),
            //           ],
            //         ),
            //       );
            //     },
            //   ),
            // )
            Expanded(
                child: Obx(() => GridView.builder(
                      itemCount: product.posts.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 300,
                          mainAxisSpacing: 2,
                          crossAxisSpacing: 2),
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: Colors.black38)),
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                child: Image.network(
                                  product.posts[index].image!,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              Container(
                                height: 80,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 10),
                                child: Text(
                                  product.posts[index].title!,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                '${product.posts[index].price}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue.shade400),
                              )
                            ],
                          ),
                        );
                      },
                    )))
          ],
        ),
      ),
    );
  }
}
