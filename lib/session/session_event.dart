import 'package:meta/meta.dart';

abstract class SessionEvent {}

class AppStarted extends SessionEvent {}

class LoggedIn extends SessionEvent {
  final String token;

  LoggedIn({
    @required this.token,
  });
}

class LoggedOut extends SessionEvent {}
