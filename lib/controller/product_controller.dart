import 'package:demo/model/post.dart';
import 'package:demo/network/network_request.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  // var titles = <String>[].obs;
  // var images = <String>[].obs;
  // var descriptions = <String>[].obs;
  // var categorys = <String>[].obs;
  // var prices = <String>[].obs;
  // var id = <String>[].obs;

  // var isloading = false.obs;

  // @override
  // void onInit() {
  //   super.onInit();
  //   fetchData();
  // }

  // void fetchData() async {
  //   try {
  //     isloading(true);
  //     http.Response response =
  //         await http.get(Uri.tryParse('https://fakestoreapi.com/products')!);
  //     if (response.statusCode == 200) {
  //       var result = json.decode(response.body);
  //       titles.value = List<String>.from(result.map((item) => item['title']));
  //       images.value = List<String>.from(result.map((item) => item['image']));
  //       descriptions.value =
  //           List<String>.from(result.map((item) => item['description']));
  //       categorys.value =
  //           List<String>.from(result.map((item) => item['category']));
  //       prices.value = List<String>.from(result.map((item) => item['price']));
  //       id.value = List<String>.from(result.map((item) => item['id']));
  //     } else {
  //       print('Lỗi');
  //     }
  //   } catch (e) {
  //     print('Error while getting data is $e');
  //   } finally {
  //     isloading(false);
  //   }
  // }
  RxList<Post> posts = RxList<Post>();

  var product = Post().obs;

  void setProduct(Post newProduct) {
    product.value = newProduct;
  }

  @override
  void onInit() {
    super.onInit();
    getPosts();
  }

  getPosts() async {
    var response = await dataServices().getPosts();
    if (response is List<Post>) {
      posts.addAll(response);
    }
  }
}
