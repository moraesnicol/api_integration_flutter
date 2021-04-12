import 'package:api_integration_flutter/pages/add_post.dart';
import 'package:flutter/material.dart';



import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog App',
      
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      
      home: HomePage(),
      routes: <String, WidgetBuilder> {
      '/addpost': (BuildContext context) => AddBlogPage(),
     
    },
    );
  }
}
