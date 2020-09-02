import 'package:flutter/material.dart';

import 'screens/tab_handler.dart';
import 'util/global_colors.dart';
import 'package:provider/provider.dart';
import 'package:nexpo_app_flutter/providers/auth_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Arkad',
        theme: ThemeData(
          primarySwatch: GlobalColors.arkadBlue,
        ),
        home: TabHandler(),
      ),
    );
  }
}
