import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:expertgg/home.dart';
import 'package:expertgg/login/login.dart';
import 'package:expertgg/middleware.dart';
import 'package:expertgg/session/session.dart';
import 'package:expertgg/splash/splash.dart';

void main() async {
  BlocSupervisor().delegate = SimpleBlocDelegate();
  return runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final SessionBloc _sessionBloc = SessionBloc();

  _AppState() {
    _sessionBloc.onAppStart();
  }

  @override
  dispose() {
    _sessionBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SessionBloc>(
      bloc: _sessionBloc,
      child: CupertinoApp(
        title: 'ExpertGG',
        home: _buildHomePage(),
      ),
    );
  }

  Widget _buildHomePage() {
    return BlocBuilder<SessionEvent, SessionState>(
      bloc: _sessionBloc,
      builder: (context, state) {
        List<Widget> widgets = [];

        if (state.isAuthenticated) {
          widgets.add(HomePage());
        } else {
          widgets.add(LoginPage());
        }

        if (state.isInitializing) {
          widgets.add(SplashPage());
        }

        if (state.isLoading) {
          widgets.add(_loadingIndicator());
        }

        return Stack(
          children: widgets,
        );
      },
    );
  }

  _loadingIndicator() {
    return Center(
      child: Text('Loading'),
    );
  }
}
