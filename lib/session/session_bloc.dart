import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:expertgg/session/session.dart';
import 'package:expertgg/jwt.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  void onAppStart() {
    dispatch(AppStarted());
  }

  void onLogin({@required String token}) {
    dispatch(LoggedIn(token: token));
  }

  void onLogout() {
    dispatch(LoggedOut());
  }

  @override
  SessionState get initialState => SessionState.initializing();

  @override
  Stream<SessionState> mapEventToState(currentState, event) async* {
    // AppStarted
    if (event is AppStarted) {
      final token = await getToken();
      if (token != null) {
        final user = await loadUser();
        yield SessionState.authenticated(user);
      } else {
        yield currentState.copyWith(isInitializing: false);
      }
    }

    // LoggedIn
    if (event is LoggedIn) {
      yield currentState.copyWith(isLoading: true);
      await setToken(event.token);
      final user = await loadUser();
      yield SessionState.authenticated(user);
    }

    // LoggedOut
    if (event is LoggedOut) {
      yield currentState.copyWith(isLoading: true);
      await removeToken();
      yield SessionState.unauthenticated();
    }
  }
}
