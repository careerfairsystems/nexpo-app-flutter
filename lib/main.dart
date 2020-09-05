import 'package:flutter/material.dart';
import 'package:nexpo_app_flutter/util/constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'screens/tab_handler.dart';
import 'util/global_colors.dart';
import 'package:nexpo_app_flutter/providers/auth_provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.storage = new FlutterSecureStorage();
  Constants.authProvider = AuthProvider();
  await Constants.storage.write(key: "test", value: "bajs");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Arkad',
      theme: ThemeData(
        primarySwatch: GlobalColors.arkadBlue,
      ),
      home: TabHandler(),
    );
  }
}
