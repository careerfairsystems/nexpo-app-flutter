import 'package:flutter/material.dart';

import '../../widgets/Form/login_form.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
