import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter_template/core/providers/post_data.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final postData = Provider.of<PostData>(context);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Home')
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 32, vertical: 10),
          child: Column(
            children: <Widget>[
              Container(
                height: 280,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          controller: TextEditingController(text: postData.title),
                          onChanged: (val) {
                            postData.titleUpdate(val);
                          },
                          decoration: InputDecoration(
                            labelText: 'Title',
                          ),
                        )
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('Body', style: TextStyle(fontWeight: FontWeight.w300)),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          maxLines: 3,
                          controller: TextEditingController(text: postData.body),
                          onChanged: (val) {
                            postData.bodyUpdate(val);
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder()
                          ),
                        )
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () async {
                            await postData.addPost();
                            Navigator.pushNamed(context, '/list');
                          },
                          icon: Icon(Icons.check, color: Colors.green)
                        )
                      )
                    ],
                  )
                )
              ),
              Align(
                alignment: Alignment.topRight,
                child: RaisedButton(
                  onPressed: () => Navigator.pushNamed(context, '/list'),
                  child: Text('View Posts')
                )
              )
            ],
          )
        )
      )
    );
  }
}
