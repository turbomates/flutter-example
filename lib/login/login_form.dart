import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:expertgg/login/login.dart';
import 'package:expertgg/session/session.dart';

class LoginForm extends StatefulWidget {
  final LoginBloc _loginBloc;
  final SessionBloc _sessionBloc;

  LoginForm({
    Key key,
    @required LoginBloc loginBloc,
    @required SessionBloc sessionBloc,
  })  : _loginBloc = loginBloc,
        _sessionBloc = sessionBloc,
        super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState(
        loginBloc: _loginBloc,
        sessionBloc: _sessionBloc,
      );
}

class _LoginFormState extends State<LoginForm> {
  final LoginBloc _loginBloc;
  final SessionBloc _sessionBloc;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordFocus = FocusNode();

  _LoginFormState({
    @required LoginBloc loginBloc,
    @required SessionBloc sessionBloc,
  })  : _loginBloc = loginBloc,
        _sessionBloc = sessionBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginEvent, LoginState>(
      bloc: _loginBloc,
      builder: (context, loginState) {
        if (_loginSucceeded(loginState)) {
          _sessionBloc.onLogin(token: loginState.token);
          _loginBloc.onLoginSuccess();
        }

        return _form(loginState);
      },
    );
  }

  Widget _form(LoginState loginState) {
    final email = CupertinoTextField(
      controller: _usernameController,
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      placeholder: 'Email',
      autofocus: true,
      onSubmitted: (event) {
        FocusScope.of(context).requestFocus(_passwordFocus);
      },
    );

    final password = CupertinoTextField(
      controller: _passwordController,
      autocorrect: false,
      autofocus: false,
      obscureText: true,
      placeholder: 'Password',
      focusNode: _passwordFocus,
      onSubmitted: loginState.isLoginButtonEnabled
          ? (event) => _onLoginButtonPressed()
          : null,
    );

    final loginButton = CupertinoButton(
      color: CupertinoColors.activeBlue,
      onPressed: loginState.isLoginButtonEnabled ? _onLoginButtonPressed : null,
      child: Text('Log In'),
    );

    return CupertinoPageScaffold(
      child: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
          ],
        ),
      ),
    );
  }

  bool _loginSucceeded(LoginState state) => state.token.isNotEmpty;
  void _onLoginButtonPressed() {
    _loginBloc.onLoginButtonPressed(
      username: _usernameController.text,
      password: _passwordController.text,
    );
  }
}
