import 'dart:convert';

import 'package:nexpo_app_flutter/util/communicator.dart';
import 'package:nexpo_app_flutter/util/constants.dart';
import 'package:redux/redux.dart';
import 'package:meta/meta.dart';
import 'package:nexpo_app_flutter/redux/store.dart';
import 'package:nexpo_app_flutter/models/user.dart';
import 'package:nexpo_app_flutter/redux/user/user_state.dart';

@immutable
class SetUserStateAction {
  final UserState userState;

  SetUserStateAction(this.userState);
}

Future<void> fetchUserData(Store<AppState> store, String accessToken) async {
  store.dispatch(SetUserStateAction(UserState(
    isLoading: true,
  )));

  try {
    //We gotta get the accessToken from previous user.
    final response = await Communicator.sendAuthorizedGetReq(
        Constants.studentInfoURL, accessToken);
    assert(response.statusCode == 200);
    final jsonData = json.decode(response.body);
    store.dispatch(
      SetUserStateAction(
        UserState(
          isLoading: false,
          user: User.fromJson(jsonData),
        ),
      ),
    );
  } catch (error) {
    store.dispatch(SetUserStateAction(UserState(
      isLoading: false,
      isError: true,
    )));
  }
}
