import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nexpo_app_flutter/redux/store.dart';
import 'package:nexpo_app_flutter/screens/profile/dashboard_screen.dart';
import 'package:nexpo_app_flutter/screens/profile/login_screen.dart';

class ProfileHandler extends StatefulWidget {
  @override
  _ProfileHandlerState createState() => _ProfileHandlerState();
}

class _ProfileHandlerState extends State<ProfileHandler> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, String>(
      distinct: true,
      converter: (store) => store.state.authState.accessToken,
      builder: (context, accessToken) {
        if (accessToken == "") {
          return LoginScreen();
        } else {
          return DashboardScreen();
        }
      },
    );
  }
}
