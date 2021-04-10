import 'package:api_integration_flutter/models/postsInfo.dart';
import 'package:api_integration_flutter/services/api_manager.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Result> _result;

  @override
  void initState() {
    _result = API_Manager().getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog App'),
      ),
      body: Container(
        child: FutureBuilder(
          future: _result,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  color: Colors.red,
                );
              });
            }
          },
        ),
      ),
    );
  }
}
