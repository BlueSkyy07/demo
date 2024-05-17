import 'package:demo/controller/product_controller.dart';
import 'package:demo/pages/productdetail_page.dart';
import 'package:demo/pages/timkiem.dart';
import 'package:demo/values/app_assets.dart';
import 'package:demo/widgets/rate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final ProductController product = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black12,
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
            onTap: () {
              Get.to(timkiem());
            },
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Category"),
                          InkWell(
                            onTap: () {},
                            child: Text("More Category"),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Obx(() => GridView.builder(
                        itemCount: product.posts.length,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 300,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.find<ProductController>()
                                  .setProduct(product.posts[index]);
                              Get.to(ProductDetailPage());
                            },
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  border: Border.all(
                                      width: 1, color: Colors.black38)),
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
                                    padding: EdgeInsets.symmetric(vertical: 12),
                                    height: 64,
                                    child: Text(
                                      product.posts[index].title!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  StarRating(
                                    rating: product.posts[index].rating?.rate
                                            ?.toDouble() ??
                                        0.0,
                                    size: 19,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      '\$${product.posts[index].price} ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue.shade400),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
