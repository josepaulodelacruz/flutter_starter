import 'package:flutter/foundation.dart';
import 'package:starter_template/core/services/api.dart';
import 'package:starter_template/core/models/Post.dart';

class PostData extends ChangeNotifier {
  Api _api = Api();
  String _title;
  String _body;

  String get title => _title;
  String get body => _body;

  titleUpdate (String text) {
    _title = text;
  }

  bodyUpdate (String text) {
    _body = text;
  }

  fetchPosts () async {
    List<dynamic> posts = await _api.getPostsForUser();
    return posts;
  }

  addPost () async {
    Map<String, dynamic> _post = {'title': _title, 'body': _body};
    final posts = await fetchPosts();
    posts.add(Post.fromJson(_post));
    return posts;
  }


}
