import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:expertgg/login/login.dart';
import 'package:expertgg/http.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginState get initialState => LoginState.initial();

  void onLoginButtonPressed({String username, String password}) {
    dispatch(
      LoginButtonPressed(
        username: username,
        password: password,
      ),
    );
  }

  void onLoginSuccess() {
    dispatch(LoggedIn());
  }

  @override
  Stream<LoginState> mapEventToState(currentState, event) async* {
    // LoginButtonPressed
    if (event is LoginButtonPressed) {
      yield LoginState.loading();

      try {
        final token = await http.login(event.username, event.password);
        yield LoginState.success(token);
      } catch (error) {
        yield LoginState.failure(error.toString());
      }
    }

    if (event is LoggedIn) {
      yield LoginState.initial();
    }
  }
}
