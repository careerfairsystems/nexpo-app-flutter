import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nexpo_app_flutter/redux/auth/auth_actions.dart';
import 'package:nexpo_app_flutter/redux/store.dart';
import 'package:nexpo_app_flutter/redux/user/user_actions.dart';
import 'package:nexpo_app_flutter/redux/user/user_state.dart';
import 'package:nexpo_app_flutter/util/constants.dart';
import 'package:nexpo_app_flutter/util/global_colors.dart';
import 'package:nexpo_app_flutter/util/global_styles.dart';
import 'package:nexpo_app_flutter/util/theme.dart';
import 'package:nexpo_app_flutter/widgets/Buttons/filled_button.dart';
import 'package:nexpo_app_flutter/models/user.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _logout = () async {
      Redux.store.dispatch(logout(Redux.store));
    };

    var _loading = Center(
      child: CircularProgressIndicator(),
    );

    return StoreConnector<AppState, UserState>(
      distinct: true,
      converter: (store) => store.state.userState,
      builder: (context, userState) {
        if (userState.isLoading) {
          return _loading;
        } else if (userState.user == null) {
          Redux.store.dispatch(fetchUserData(
              Redux.store, Redux.store.state.authState.accessToken));
          return _loading;
        } else if (userState.isError) {
          return Text("There was an error loading user info");
        } else {
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
                          child: Text("Name"),
                        ),
                        width: double.infinity,
                        height: 100),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    elevation: 10,
                  ),
                  SizedBox(height: 25),
                  FilledButton("Logout", GlobalStyles.buttonTextStyle,
                      GlobalColors.arkadBlue, _logout),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
