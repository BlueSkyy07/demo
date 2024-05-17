import 'package:demo/model/post.dart';
import 'package:demo/network/network_request.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxList<Post> posts = RxList<Post>();
  var isLoading = false.obs;
  var product = Post().obs;
  RxList<Post> searchResults = RxList<Post>();

  @override
  void onInit() {
    super.onInit();
    getPosts();
  }

  void setProduct(Post newProduct) {
    product.value = newProduct;
  }

  Future<void> getPosts() async {
    isLoading.value = true;
    try {
      var response = await dataServices().getPosts();
      if (response is List<Post>) {
        posts.addAll(response);
      }
    } catch (e) {
      print('Error fetching posts: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void searchProducts(String query) {
    if (query.isEmpty) {
      searchResults.value = [];
    } else {
      searchResults.value = posts
          .where((product) =>
              product.title!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
