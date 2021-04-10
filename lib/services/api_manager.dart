import 'package:api_integration_flutter/constants/Strings.dart';
import 'package:http/http.dart' as http;

class API_Manager {
  void getPosts() async {
    var client = http.Client();

    var response = await client.get(Uri.parse(
        'https://run.mocky.io/v3/29ca1a88-ec02-44aa-9d26-214983b174a9'));
    if (response.statusCode == 200) {
      var jsonString = response.body;

    }
  }
}
