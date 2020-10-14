import 'package:http/http.dart';
import 'package:nexpo_app_flutter/util/constants.dart';
import 'package:nexpo_app_flutter/util/communicator.dart';
import 'dart:convert';
import 'company.dart';

class StudentSessionApplication {
  int _applicationId;
  Company _company;

  int get applicationId => _applicationId;
  Company get company => _company;

  static List<StudentSessionApplication> listFromJSON(Iterable data) {
    List<StudentSessionApplication> sessionList = new List();
    print("Length");
    print(data.length);
    for (Map<String, dynamic> x in data) {
      print("x");
      sessionList.add(StudentSessionApplication.fromData(x));
    }
    print("Sessionlist length:");
    print(sessionList.length);
    return sessionList;
  }

  factory StudentSessionApplication.fromData(Map<String, dynamic> data) {
    return StudentSessionApplication(
        data['id'] as int,
        Company(
            data['company']['website'],
            data['company']['name'],
            data['company']['logo_url'],
            data['company']['id'],
            data['company']['description']));
  }

  StudentSessionApplication(this._applicationId, this._company);
}
