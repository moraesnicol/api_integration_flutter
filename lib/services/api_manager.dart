import 'dart:convert';

import 'package:api_integration_flutter/constants/Strings.dart';
import 'package:api_integration_flutter/models/postsInfo.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class API_Manager {
  Future<PostsGet> getPosts() async {
    var client = http.Client();
    var postsGet;

    try {
      var response = await client.get(Uri.parse(Strings.posts));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        postsGet = PostsGet.fromJson(jsonMap);
      }
    } catch (Exception) {
      return postsGet;
    }
    return postsGet;
  }
}
