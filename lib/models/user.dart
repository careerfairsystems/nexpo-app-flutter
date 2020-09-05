import 'package:http/http.dart';
import 'package:nexpo_app_flutter/util/constants.dart';
import 'package:nexpo_app_flutter/util/communicator.dart';
import 'dart:convert';

class User {
  String _phoneNumber;
  String _firstName;
  String _lastName;
  int _id;
  String _foodPreferences;
  String _email;

  String get phoneNumber => _phoneNumber;
  String get firstName => _firstName;
  String get lastName => _lastName;
  int get id => _id;
  String get foodPreferences => _foodPreferences;
  String get email => _email;

  User(
    this._phoneNumber,
    this._firstName,
    this._lastName,
    this._id,
    this._foodPreferences,
    this._email,
  );

  static Future<User> updateStoredUserInformation() async {
    User u;
    String accessToken = await Constants.storage.read(key: "access_token");
    if (accessToken != null) {
      Response result = await Communicator.sendAuthorizedGetReq(
          Constants.studentInfoURL, accessToken);
      Map<String, dynamic> response = json.decode(result.body);
      await Constants.storage.write(
        key: "phone_number",
        value: response['data']['phone_number'],
      );
      await Constants.storage
          .write(key: "first_name", value: response['data']['first_name']);
      await Constants.storage.write(
        key: "last_name",
        value: response['data']['last_name'],
      );
      await Constants.storage.write(
        key: "id",
        value: response['data']['id'].toString(),
      );
      await Constants.storage.write(
          key: "food_preferences", value: response['data']['food_preferences']);
      await Constants.storage.write(
        key: "email",
        value: response['data']['email'],
      );
      u = User(
        response['data']['phone_number'],
        response['data']['first_name'],
        response['data']['last_name'],
        response['data']['id'],
        response['data']['food_preferences'],
        response['data']['email'],
      );
    }
    return u;
  }
}
