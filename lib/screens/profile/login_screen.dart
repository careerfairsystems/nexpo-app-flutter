import 'package:flutter/material.dart';

import '../../widgets/Form/login_form.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Image(
                image: AssetImage('assets/arkad_logo.png'),
                height: 150,
                width: 150,
              ),
            ),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
