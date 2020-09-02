import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart';

import '../util/api.dart';

enum Status {
  NotLoggedIn,
  LoggedIn,
  Authenticating,
  Registering,
  LoggedOut,
}

class AuthProvider with ChangeNotifier {
  Status _loggedInStatus = Status.NotLoggedIn;

  Status get loggedInStatus => _loggedInStatus;

  Future<String> login(String email, String password) async {
    var result;

    final Map<String, dynamic> loginData = {
      'email': email,
      'password': password,
    };

    _loggedInStatus = Status.Authenticating;

    notifyListeners();

    Response response = await post(
      Api.login,
      body: json.encode(loginData),
      //Not sure about headers at the moment. Should definetely be looked at!
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      String accessToken = responseData['data']['jwt'];
      print(accessToken);

      _loggedInStatus = Status.LoggedIn;
      notifyListeners();

      result = "Success!";
      //We need to store the accessToken securely.
    } else {
      _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();

      result = "Failure!";
      //Here we give back a result.
    }
    return result;
  }
}
