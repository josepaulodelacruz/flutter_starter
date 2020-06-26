import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter_template/core/providers/post_data.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts')
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: Consumer<PostData>(
          builder: (context, postData, child) {
            return FutureBuilder(
              future: postData.addPost(),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.done) {
                  var posts = snapshot.data;
                  return ListView.builder(
                    reverse: true,
                    itemCount: 7,
                    itemBuilder: (_, int index) => Card(
                      child: ListTile(
                        onTap: () => Navigator.pushNamed(context, '/view', arguments: posts[index]),
                        title: Text('${posts[index].title}'),
                        subtitle: Text('${posts[index].body}'),
                      )
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator()
                  );
                }
              },
            );
          },
        ),
      )
    );
  }
}
