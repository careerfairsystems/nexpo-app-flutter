import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nexpo_app_flutter/redux/auth/auth_actions.dart';
import 'package:nexpo_app_flutter/redux/auth/auth_state.dart';
import 'package:nexpo_app_flutter/redux/store.dart';
import 'package:nexpo_app_flutter/util/constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nexpo_app_flutter/util/theme.dart';

import 'screens/tab_handler.dart';

void main() async {
  await Redux.init();
  WidgetsFlutterBinding.ensureInitialized();
  Constants.storage = FlutterSecureStorage();
  var _accessToken = await Constants.storage.read(key: "access_token");
  if (_accessToken == null) {
    _accessToken = "";
  }
  Redux.store.dispatch(SetAuthStateAction(AuthState(
    accessToken: _accessToken,
  )));

  print(_accessToken);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Arkad',
      theme: appTheme,
      home: StoreProvider<AppState>(
        store: Redux.store,
        child: TabHandler(),
      ),
    );
  }
}
