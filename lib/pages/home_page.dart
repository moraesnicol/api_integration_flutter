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
  Future<PostsGet> _postsGet;

  @override
  void initState() {
    _postsGet = API_Manager().getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog App'),
      ),
      body: Container(
        child: FutureBuilder<PostsGet>(
          future: _postsGet,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.result.length,
                  itemBuilder: (context, index) {
                    var post = snapshot.data.result[index];

                    return Container(
                      height: 100,
                      child: Row(
                        children: [
                          Image.network(post.autorImageUrl),
                        ],
                      ),
                    );
                  });
            } else
              return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
