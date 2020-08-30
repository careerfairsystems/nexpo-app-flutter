import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
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
        ],
      ),
    );
  }
}
