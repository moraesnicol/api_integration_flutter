import 'dart:convert';

import 'package:api_integration_flutter/models/postsInfo.dart';
import 'package:http/http.dart' as http;

class API_Manager {
  Future<Result> getPosts() async {
    var client = http.Client();
    var result = null;


try{
    var response = await client.get(Uri.parse(
        'https://run.mocky.io/v3/29ca1a88-ec02-44aa-9d26-214983b174a9'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      result = Result.fromJson(jsonMap);
    }
  }
  catch(Exception)
  {

    return result;
  }
  }

  
}
