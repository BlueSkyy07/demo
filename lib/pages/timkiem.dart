import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:demo/controller/product_controller.dart';
import 'package:demo/pages/productdetail_page.dart';
import 'package:demo/values/app_assets.dart';
import 'package:demo/widgets/rate.dart';

class timkiem extends StatefulWidget {
  @override
  _timkiemState createState() => _timkiemState();
}

class _timkiemState extends State<timkiem> {
  final ProductController productController = Get.put(ProductController());
  final TextEditingController searchController = TextEditingController();

  void onSearchChanged(String query) {
    productController.searchProducts(query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Search')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50,
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 145, 145, 145),
                  ),
                  onChanged: onSearchChanged,
                ),
              ),
              Container(
                height: 500,
                child: Obx(() {
                  if (productController.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  } else if (productController.searchResults.isEmpty) {
                    return Center(child: Text('No products found'));
                  } else {
                    return GridView.builder(
                      padding: const EdgeInsets.all(16.0),
                      itemCount: productController.searchResults.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16.0,
                        crossAxisSpacing: 16.0,
                        childAspectRatio: 0.7,
                      ),
                      itemBuilder: (context, index) {
                        final product = productController.searchResults[index];
                        return GestureDetector(
                          onTap: () {
                            productController.setProduct(product);
                            Get.to(ProductDetailPage());
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black38),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 150,
                                  child: Image.network(
                                    product.image!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  product.title!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 8.0),
                                StarRating(
                                  rating:
                                      product.rating?.rate?.toDouble() ?? 0.0,
                                  size: 19,
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  '\$${product.price}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                }),
              ),
            ],
          ),
        ));
  }
}
