import 'package:http/http.dart';
import 'package:nexpo_app_flutter/util/constants.dart';
import 'package:nexpo_app_flutter/util/communicator.dart';
import 'dart:convert';
import 'student_session_application.dart';

class User {
  String _phoneNumber;
  String _firstName;
  String _lastName;
  int _id;
  String _foodPreferences;
  String _email;
  String _programme;
  String _year;
  List<StudentSessionApplication> _sessionApplications;

  String get phoneNumber => _phoneNumber;
  String get firstName => _firstName;
  String get lastName => _lastName;
  int get id => _id;
  String get foodPreferences => _foodPreferences;
  String get email => _email;
  String get programme => _programme;
  String get year => _year;
  List<StudentSessionApplication> get applications => _sessionApplications;

  User(
      this._phoneNumber,
      this._firstName,
      this._lastName,
      this._id,
      this._foodPreferences,
      this._email,
      this._programme,
      this._year,
      this._sessionApplications);

  User.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    this._phoneNumber = json['data']['phone_number'];
    this._firstName = json['data']['first_name'];
    this._lastName = json['data']['last_name'];
    this._id = json['data']['id'];
    this._foodPreferences = json['data']['food_preferences'];
    this._email = json['data']['email'];
    this._programme = json['data']['student']['programme'];
    this._year = json['data']['student']['year'];
    this._sessionApplications = StudentSessionApplication.listFromJSON(
        json['data']['student']['student_session_applications']);
  }
}
