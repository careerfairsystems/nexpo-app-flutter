import 'package:flutter/material.dart';

import '../global_colors.dart';

class TabHandler extends StatefulWidget {
  @override
  _TabHandlerState createState() => _TabHandlerState();
}

class _TabHandlerState extends State<TabHandler> {
  int _currentIndex = 0;

  final _tabs = [
    Center(
      child: Text("Home"),
    ),
    Center(
      child: Text("Map"),
    ),
    Center(
      child: Text("Companies"),
    ),
    Center(
      child: Text("Profile"),
    ),
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
        title: _appBars[_currentIndex],
        elevation: 10,
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            title: Text("Home"),
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home),
            backgroundColor: GlobalColors.arkadBlue,
          ),
          BottomNavigationBarItem(
            title: Text("Map"),
            icon: Icon(Icons.map),
            activeIcon: Icon(Icons.map),
            backgroundColor: GlobalColors.arkadBlue,
          ),
          BottomNavigationBarItem(
            title: Text("Companies"),
            icon: Icon(Icons.people_outline),
            activeIcon: Icon(Icons.people),
            backgroundColor: GlobalColors.arkadBlue,
          ),
          BottomNavigationBarItem(
            title: Text("Profile"),
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            backgroundColor: GlobalColors.arkadBlue,
          ),
          BottomNavigationBarItem(
            title: Text("About"),
            icon: Icon(Icons.info_outline),
            activeIcon: Icon(Icons.info),
            backgroundColor: GlobalColors.arkadBlue,
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
