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
import 'package:nexpo_app_flutter/widgets/containers/imagecontainers/profile_image.dart';

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
        } else if (userState.isError) {
          return Column(
            children: [
              Text("There was an error loading user info"),
              FilledButton("Go Back", GlobalStyles.buttonTextStyle,
                  GlobalColors.arkadBlue, _logout)
            ],
          );
        } else if (userState.user == null) {
          Redux.store.dispatch(fetchUserData(
              Redux.store, Redux.store.state.authState.accessToken));
          return _loading;
        } else {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                  ProfileImage(),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: <Widget>[
                        Text(
                          userState.user.firstName +
                              " " +
                              userState.user.lastName,
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            userState.user.programme != null
                                ? userState.user.programme
                                : "Program information missing",
                            style: Theme.of(context).textTheme.bodyText1),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            userState.user.year != null
                                ? userState.user.year
                                : "Year information missing",
                            style: Theme.of(context).textTheme.bodyText2),
                      ],
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints.expand(height: 200),
                    child: ListView(
                      padding:
                          EdgeInsets.symmetric(vertical: 25, horizontal: 16),
                      scrollDirection: Axis.horizontal,
                      children: [
                        Card(
                          child: Container(
                              child: Text(
                                  userState.user.applications[0].company.name),
                              width: 100),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          elevation: 5,
                          color: Colors.white,
                        ),
                        Card(
                          child: Container(child: Text('Test'), width: 100),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          elevation: 5,
                          color: Colors.white,
                        ),
                        Card(
                          child: Container(child: Text('Test'), width: 100),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          elevation: 5,
                          color: Colors.white,
                        ),
                        Card(
                          child: Container(child: Text('Test'), width: 100),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          elevation: 5,
                          color: Colors.white,
                        ),

                        //This is where we will put the Event cards..
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: FilledButton("Logout", GlobalStyles.buttonTextStyle,
                        GlobalColors.arkadBlue, _logout),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
