import 'package:flutter/material.dart';
import 'package:starter_template/core/providers/post_data.dart';
import 'package:starter_template/core/utils/colorParse.dart';
import 'package:provider/provider.dart';

//routes
import 'package:starter_template/ui/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PostData>(
          create: (_) => PostData(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: getColorFromHex('#f3f3f3')
        ),
        title: 'Provider Starter project',
        initialRoute: '/',
        onGenerateRoute: Router.generateRoute,
      )
    );
  }
}

