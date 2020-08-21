import 'package:flutter/material.dart';

import 'screens/tab_handler.dart';
import 'global_colors.dart';

void main() => runApp(MyApp());

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
