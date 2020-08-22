import 'package:flutter/material.dart';

import '../../global_styles.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 20),
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Upcoming Events", style: GlobalStyles.titleStyleScreen),
              Spacer(),
              InkWell(
                child: Text(
                  "See all >",
                  style: TextStyle(color: Colors.blueAccent),
                ),
                onTap: () {
                  print("Open all events");
                },
              )
            ],
          ),
        ),
        Container(
          constraints: BoxConstraints.expand(height: 200),
          child: ListView(
            padding: EdgeInsets.only(left: 40),
            scrollDirection: Axis.horizontal,
            children: [
              //This is where we will put the Event cards..
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "News",
                style: GlobalStyles.titleStyleScreen,
              )
            ],
          ),
        ),
        //This is where we will put newscards
      ],
    );
  }
}
