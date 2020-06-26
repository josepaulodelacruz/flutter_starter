import 'package:flutter/material.dart';

class ViewListScreen extends StatelessWidget {
  final post;

  ViewListScreen({this.post});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('View List')
      ),
      body: Container(
        margin: EdgeInsets.all(32),
        child: Card(
          child: ListTile(
            title: Text('${post.title}'),
            subtitle: Text('${post.body}'),
          ),
        )
      ) 
    );
  }
}
