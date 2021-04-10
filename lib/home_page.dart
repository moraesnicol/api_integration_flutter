import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog App'),
      ),
      body: Container(
        child: ListView.builder(itemBuilder: (context, index) {
          return Container(
            height: 100,
            color: Colors.red,
            
          );
        }),
      ),
    );
  }
}
