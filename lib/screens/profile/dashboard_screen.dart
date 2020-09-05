import 'package:flutter/material.dart';
import 'package:nexpo_app_flutter/util/constants.dart';
import 'package:nexpo_app_flutter/util/global_colors.dart';
import 'package:nexpo_app_flutter/util/global_styles.dart';
import 'package:nexpo_app_flutter/widgets/Buttons/filled_button.dart';
import 'package:nexpo_app_flutter/models/user.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var logout = () async {
      Constants.authProvider.logout();
    };

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(
              Icons.person,
              size: 160,
            ),
            Card(
              child: SizedBox(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(Constants.authProvider.user.firstName),
                  ),
                  width: double.infinity,
                  height: 100),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              elevation: 10,
            ),
            SizedBox(height: 25),
            FilledButton("Logout", GlobalStyles.buttonTextStyle,
                GlobalColors.arkadBlue, logout),
          ],
        ),
      ),
    );
  }
}
