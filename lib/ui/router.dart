import 'package:flutter/material.dart';
import 'package:starter_template/core/models/Post.dart';
import 'package:starter_template/ui/views/DefaultScreens/HomeScreen.dart';
import 'package:starter_template/ui/views/DefaultScreens/ListScreen.dart';
import 'package:starter_template/ui/views/DefaultScreens/ViewListScreen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/list':
        return MaterialPageRoute(builder: (_) => ListScreen());
      case '/view':
        Post post = settings.arguments;
        return MaterialPageRoute(builder: (_) => ViewListScreen(post: post));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No defined route'))
          )
        );
    }
  }
}
