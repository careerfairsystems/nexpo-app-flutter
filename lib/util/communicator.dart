import 'dart:convert';
import 'package:http/http.dart';

class Communicator {
  static Future<Response> sendPostReq(
      String url, Map<String, dynamic> data) async {
    Response response = await post(
      url,
      body: json.encode(data),
      headers: {'Content-Type': 'application/json'},
    );

    return response;
  }

  static Future<Response> sendAuthorizedGetReq(
      String url, String accessToken) async {
    Response response = await get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': "Bearer " + accessToken
      },
    );
    return response;
  }
}
