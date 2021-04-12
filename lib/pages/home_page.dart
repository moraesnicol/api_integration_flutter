import 'package:api_integration_flutter/models/postsInfo.dart';
import 'package:api_integration_flutter/services/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:google_fonts/google_fonts.dart';

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
    // ignore: unnecessary_statements

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 0.3,
        brightness: Brightness.dark,
        title: Text(
          'App Blog',
          style: GoogleFonts.roboto(
              color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
              width: 120,
              height: 20,
              child: IconButton(
                onPressed: () => Navigator.pushNamed(context, '/addpost'),
                icon: Icon(Icons.add, size: 30, color: Colors.red),
              )),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.black87),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder<PostsGet>(
          future: _postsGet,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.result.length,
                  reverse: true,
                  physics: BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(top: 30, bottom: 80),
                  itemBuilder: (context, index) {
                    var post = snapshot.data.result[index];

                    return Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                Colors.indigoAccent[700],
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                          borderRadius: BorderRadius.circular(20)),
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height /
                                        3.0,
                                    image: NetworkImage(post.autorImageUrl),
                                    fit: BoxFit.cover,
                                    // filterQuality: FilterQuality.medium,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.favorite_border_rounded,
                                        size: 30,
                                        color: Colors.white,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        FontAwesomeIcons.comment,
                                        size: 25,
                                        color: Colors.white,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        FontAwesomeIcons.shareAlt,
                                        size: 25,
                                        color: Colors.white,
                                      )),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Text(
                                    post.autorNome,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ]),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    // padding: EdgeInsets.all(10),
                                    child: AutoSizeText(
                                      post.texto,
                                      style: GoogleFonts.roboto(
                                          fontSize: 24, color: Colors.white),
                                      minFontSize: 14,
                                      maxLines: 7,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ])),
                          ]),
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
