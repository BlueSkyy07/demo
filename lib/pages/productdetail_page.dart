import 'package:demo/controller/product_controller.dart';
import 'package:demo/model/post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductController products = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: Center(
        child: Obx(() {
          Post product = products.product.value;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(product.image!),
              SizedBox(height: 20),
              Text(
                product.title!,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Price: ${product.price}',
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
              // Add more details here as needed
            ],
          );
        }),
      ),
    );
  }
}
