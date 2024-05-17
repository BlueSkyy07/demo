import 'package:demo/controller/product_controller.dart';
import 'package:demo/model/post.dart';
import 'package:demo/model/post.dart';
import 'package:demo/widgets/rate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              // allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            StarRating(
              rating: 4.5,
              size: 50,
            )
          ],
        ),
      ),
    );
  }
}
