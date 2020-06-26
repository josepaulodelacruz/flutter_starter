import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:starter_template/core/models/Post.dart';

class Api {
  static const endpoint = 'https://jsonplaceholder.typicode.com';
  var client = new http.Client();

  Future<List<Post>> getPostsForUser() async {
    var posts = List<Post>();
    // Get user posts for id
    var response = await client.get('$endpoint/posts');

    // parse into List
    var parsed = json.decode(response.body) as List<dynamic>;

    // loop and convert each item to Post
    for (var post in parsed) {
      posts.add(Post.fromJson(post));
    }

    return posts;
  }

}
