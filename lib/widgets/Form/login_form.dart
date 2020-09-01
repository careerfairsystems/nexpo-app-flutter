import 'package:flutter/material.dart';

import 'package:nexpo_app_flutter/widgets/Buttons/filled_button.dart';
import 'package:nexpo_app_flutter/widgets/Form/input_field.dart';
import '../../util/global_styles.dart';
import '../../util/global_colors.dart';
import '../../util/validators.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  String _username, _password;

  @override
  Widget build(BuildContext context) {
    final usernameField = TextFormField(
      autofocus: false,
      validator: validateEmail,
      onSaved: (value) => _username = value,
      decoration: GlobalStyles.buildInputDecoration(
        "E-mail",
        Icons.email,
      ),
    );

    final passwordField = TextFormField(
      autofocus: false,
      obscureText: true,
      validator: (value) => value.isEmpty ? "Please enter password" : null,
      onSaved: (value) => _password = value,
      decoration: GlobalStyles.buildInputDecoration(
        "Password",
        Icons.lock,
      ),
    );

    var _handleLogin = () {
      final form = _formKey.currentState;

      if (form.validate()) {
        form.save();
        print("User: $_username");
        print("Pass: $_password");
        //Here we write our network login code.
      }
    };

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          usernameField,
          SizedBox(
            height: 16,
          ),
          passwordField,
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: FilledButton(
              "Log in",
              GlobalStyles.buttonTextStyle,
              GlobalColors.arkadBlue,
              _handleLogin,
            ),
          ),
          Row(
            children: <Widget>[
              InkWell(
                child: Text(
                  "Create account",
                  style: TextStyle(color: Colors.blueAccent),
                ),
                onTap: () {
                  print("Create account");
                },
              ),
              Spacer(),
              InkWell(
                child: Text(
                  "Forgot password?",
                  style: TextStyle(color: Colors.blueAccent),
                ),
                onTap: () {
                  print("Forgot password");
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
