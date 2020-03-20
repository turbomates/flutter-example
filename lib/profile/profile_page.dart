import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:expertgg/session/session.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SessionBloc sessionBloc = BlocProvider.of<SessionBloc>(context);

    return CupertinoPageScaffold(
      child: Center(
        child: CupertinoButton(
          child: Text('Logout'),
          onPressed: () {
            sessionBloc.onLogout();
          },
        ),
      ),
    );
  }
}
