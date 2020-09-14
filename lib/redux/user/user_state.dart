import 'package:meta/meta.dart';
import 'package:nexpo_app_flutter/models/user.dart';

@immutable
class UserState {
  final bool isLoading;
  final bool isError;
  final User user;

  UserState({
    this.isLoading,
    this.isError,
    this.user,
  });

  factory UserState.initial() {
    return UserState(
      isLoading: false,
      isError: false,
      user: null,
    );
  }

  UserState copyWith({
    @required bool isLoading,
    @required bool isError,
    @required User user,
  }) {
    return UserState(
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      user: user ?? this.user,
    );
  }
}
