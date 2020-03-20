import 'package:meta/meta.dart';
import 'package:expertgg/session/user.dart';

class SessionState {
  final bool isInitializing;
  final bool isAuthenticated;
  final bool isLoading;
  final User user;

  const SessionState({
    @required this.isInitializing,
    @required this.isAuthenticated,
    @required this.isLoading,
    @required this.user,
  });

  factory SessionState.initializing() {
    return SessionState(
      isInitializing: true,
      isAuthenticated: false,
      isLoading: false,
      user: null,
    );
  }

  factory SessionState.authenticated(User user) {
    return SessionState(
      isInitializing: false,
      isAuthenticated: true,
      isLoading: false,
      user: user,
    );
  }

  factory SessionState.unauthenticated() {
    return SessionState(
      isInitializing: false,
      isAuthenticated: false,
      isLoading: false,
      user: null,
    );
  }

  SessionState copyWith({
    bool isInitializing,
    bool isAuthenticated,
    bool isLoading,
    User user,
  }) {
    return SessionState(
      isInitializing: isInitializing ?? this.isInitializing,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SessionState &&
          runtimeType == other.runtimeType &&
          isInitializing == other.isInitializing &&
          isAuthenticated == other.isAuthenticated &&
          isLoading == other.isLoading &&
          user == other.user;

  @override
  int get hashCode =>
      isInitializing.hashCode ^
      isAuthenticated.hashCode ^
      isLoading.hashCode ^
      user.hashCode;
}
