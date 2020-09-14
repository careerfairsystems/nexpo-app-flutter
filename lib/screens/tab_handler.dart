import 'package:flutter/material.dart';
import 'package:nexpo_app_flutter/screens/profile/dashboard_screen.dart';
import 'package:nexpo_app_flutter/screens/profile/profile_handler.dart';

import '../util/global_colors.dart';
import '../screens/home/home_screen.dart';
import 'profile/login_screen.dart';
import '../util/constants.dart';

class TabHandler extends StatefulWidget {
  @override
  _TabHandlerState createState() => _TabHandlerState();
}

class _TabHandlerState extends State<TabHandler> {
  int _currentIndex = 0;

  final _tabs = [
    HomeScreen(),
    Center(
      child: Text("Map"),
    ),
    Center(
      child: Text("Companies"),
    ),
    ProfileHandler(),
    // Constants.authProvider.loggedInStatus == Status.LoggedIn
    //     // ? LoginScreen()
    //     // : DashboardScreen(),
    //     ? DashboardScreen()
    //     : LoginScreen(),
    Center(
      child: Text("About"),
    ),
  ];

  final _appBars = [
    Text("Arkad Home"),
    Text("Arkad Map"),
    Text("Arkad Companies"),
    Text("Arkad Profile"),
    Text("About Arkad"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        textTheme: Theme.of(context).textTheme,
        title: _appBars[_currentIndex],
        elevation: 3,
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: GlobalColors.arkadBlue,
        unselectedItemColor: GlobalColors.arkadBlue,
        elevation: 20,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            title: Text("Home"),
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text("Map"),
            icon: Icon(Icons.map),
            activeIcon: Icon(Icons.map),
          ),
          BottomNavigationBarItem(
            title: Text("Companies"),
            icon: Icon(Icons.people_outline),
            activeIcon: Icon(Icons.people),
          ),
          BottomNavigationBarItem(
            title: Text("Profile"),
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
          ),
          BottomNavigationBarItem(
            title: Text("About"),
            icon: Icon(Icons.info_outline),
            activeIcon: Icon(Icons.info),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
