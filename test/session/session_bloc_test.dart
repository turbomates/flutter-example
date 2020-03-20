import 'package:flutter_test/flutter_test.dart';
import 'package:expertgg/session/session.dart';

void main() {
  SessionBloc sessionBloc;

  setUp(() {
    sessionBloc = SessionBloc();
  });

  test('initial state is correct', () {
    expect(sessionBloc.initialState, SessionState.initializing());
  });

  test('dispose does not emit new states', () {
    expectLater(
      sessionBloc.state,
      emitsInOrder([]),
    );
    sessionBloc.dispose();
  });
}
