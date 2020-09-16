import 'dart:convert';

import 'package:nexpo_app_flutter/redux/user/user_actions.dart';
import 'package:nexpo_app_flutter/util/communicator.dart';
import 'package:nexpo_app_flutter/util/constants.dart';

import 'auth_state.dart';
import 'package:nexpo_app_flutter/redux/store.dart';
import 'package:redux/redux.dart';
import 'package:meta/meta.dart';

@immutable
class SetAuthStateAction {
  final AuthState authState;

  SetAuthStateAction(this.authState);
}

Future<void> login(Store<AppState> store, String email, String password) async {
  store.dispatch(SetAuthStateAction(AuthState(
    isAuthenticating: true,
    isError: false,
  )));

  try {
    //Fetch data
    final response =
        await Communicator.loginReq(Constants.loginURL, email, password);
    assert(response.statusCode >= 200 && response.statusCode <= 206);
    final String accessToken = json.decode(response.body)['data']['jwt'];
    await Constants.storage.write(key: "access_token", value: accessToken);
    store.dispatch(fetchUserData(store, accessToken));
    store.dispatch(SetAuthStateAction(AuthState(
      isAuthenticating: false,
      accessToken: accessToken,
      isError: false,
    )));
  } catch (error) {
    store.dispatch(SetAuthStateAction(AuthState(
      isAuthenticating: false,
      isError: true,
    )));
  }
}

Future<void> logout(Store<AppState> store) async {
  await Constants.storage.delete(key: "access_token");
  store.dispatch(SetAuthStateAction(AuthState(
    isAuthenticating: false,
    isError: false,
    accessToken: "",
  )));
}
