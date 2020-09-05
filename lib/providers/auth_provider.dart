import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart';
import 'package:nexpo_app_flutter/models/user.dart';
import 'package:nexpo_app_flutter/util/communicator.dart';

import '../util/constants.dart';

enum Status {
  LoggedIn,
  Authenticating,
  Registering,
  LoggedOut,
}

class AuthProvider with ChangeNotifier {
  Status _loggedInStatus;
  User _user;

  Status get loggedInStatus => _loggedInStatus;
  User get user {
    print("Attempting to get user!");
    if (_loggedInStatus == Status.LoggedIn) {
      print("User was logged in so we give user back.");
      return _user;
    } else {
      print("User does not appear to be logged in, return null.");
      return null;
    }
  }

  AuthProvider() {
    Future<String> accessToken = Constants.storage.read(key: "access_token");

    accessToken.then((value) {
      if (value == null) {
        _loggedInStatus = Status.LoggedOut;
      } else {
        _loggedInStatus = Status.LoggedIn;
      }
    });
  }

  Future<bool> login(String email, String password) async {
    var res;

    final Map<String, dynamic> loginData = {
      'email': email,
      'password': password,
    };

    _loggedInStatus = Status.Authenticating;
    notifyListeners();

    Response response =
        await Communicator.sendPostReq(Constants.loginURL, loginData);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      String accessToken = responseData['data']['jwt'];
      //Locally store the access token.
      await Constants.storage.write(key: "access_token", value: accessToken);

      _loggedInStatus = Status.LoggedIn;
      //User.updateStoredUserInformation().then((user) => _user = user);
      _user = await User.updateStoredUserInformation();
      if (_user == null) {
        print("User is null!");
      } else {
        print("User is not null!");
      }
      notifyListeners();

      res = true;
    } else {
      _loggedInStatus = Status.LoggedOut;
      notifyListeners();
      res = false;
    }
    return res;
  }

  void logout() async {
    var accessToken = await Constants.storage.read(key: "access_token");

    if (_loggedInStatus == Status.LoggedOut) {
      return;
    } else if (accessToken != null) {
      Constants.storage.delete(key: "access_token");
      _loggedInStatus = Status.LoggedOut;
      notifyListeners();
    } else {
      _loggedInStatus = Status.LoggedOut;
      notifyListeners();
    }
  }
}
