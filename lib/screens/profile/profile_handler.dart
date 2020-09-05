import 'package:flutter/material.dart';
import 'package:nexpo_app_flutter/screens/profile/dashboard_screen.dart';
import 'package:nexpo_app_flutter/screens/profile/login_screen.dart';
import 'package:nexpo_app_flutter/util/constants.dart';
import 'package:nexpo_app_flutter/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class ProfileHandler extends StatefulWidget {
  @override
  _ProfileHandlerState createState() => _ProfileHandlerState();
}

class _ProfileHandlerState extends State<ProfileHandler> {
  Status _isLoggedIn = Constants.authProvider.loggedInStatus;

  Widget getBody() {
    if (_isLoggedIn == Status.LoggedIn) {
      return DashboardScreen();
    } else {
      return LoginScreen();
    }
  }

  void updateView() {
    setState(() {
      _isLoggedIn = Constants.authProvider.loggedInStatus;
    });
  }

  _ProfileHandlerState() {
    Constants.authProvider.addListener(() {
      updateView();
    });
  }

  @override
  Widget build(BuildContext context) {
    return getBody();
  }
}
