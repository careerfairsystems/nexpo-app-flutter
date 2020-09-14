import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nexpo_app_flutter/redux/auth/auth_actions.dart';
import 'package:nexpo_app_flutter/redux/store.dart';

import 'package:nexpo_app_flutter/widgets/Buttons/filled_button.dart';
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
      autocorrect: false,
      //validator: validateEmail,
      validator: (value) => value.isEmpty ? "Please enter password" : null,
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

    var loading = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        Text("    Logging in...")
      ],
    );

    var _handleLogin = () {
      final form = _formKey.currentState;

      if (form.validate()) {
        form.save();
        Redux.store.dispatch(login(Redux.store, _username, _password));
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
            child: StoreConnector<AppState, bool>(
              distinct: true,
              converter: (store) => store.state.authState.isAuthenticating,
              builder: (context, isAuthenticating) {
                if (!isAuthenticating) {
                  return FilledButton(
                    "Log in",
                    GlobalStyles.buttonTextStyle,
                    GlobalColors.arkadBlue,
                    _handleLogin,
                  );
                } else {
                  return loading;
                }
              },
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
          ),
          StoreConnector<AppState, bool>(
            distinct: true,
            converter: (store) => store.state.authState.isError,
            builder: (context, isError) {
              if (isError) {
                return Container(
                  height: 80,
                  alignment: Alignment.center,
                  child: Text("Login failed!",
                      style: GlobalStyles.errorStyleLogin),
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
