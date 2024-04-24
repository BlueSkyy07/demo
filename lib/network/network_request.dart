import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:demo/model/post.dart';

class NetworkRequest {
  // static const String url = 'https://jsonplaceholder.typicode.com/photos';
  static const String url = 'https://fakestoreapi.com/products';

  static List<Post> parsePost(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<Post> posts = list.map((model) => Post.fromJson(model)).toList();
    return posts;
  }

  static Future<List<Post>> fetchPosts({int page = 1}) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return compute(parsePost, response.body);
    } else if (response.statusCode == 404) {
      throw Exception("Not found");
    } else
      throw Exception('Can\'t get post');
  }
}

class dataServices {
  List<Post> postFromJson(String str) =>
      List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));
  String postToJson(List<Post> data) =>
      json.encode(List<dynamic>.from(data.map((e) => e.toJson())));
  var url = Uri.parse('https://fakestoreapi.com/products');

  Future<List<Post>> getPosts() async {
    var response = await http.get(url);
    return postFromJson(response.body);
  }
}
