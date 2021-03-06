import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Constants {
  static const String liveURL = "arkad-nexpo.herokuapp.com/api";
  static const String localURL = "http://192.168.0.101:4000/api";

  //Switch baseURL to switch between local backend and live backend.
  static const String baseURL = localURL;
  static const String loginURL = baseURL + "/login";
  static const String studentInfoURL = baseURL + "/me";

  static FlutterSecureStorage storage;
}
