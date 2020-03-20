import 'package:expertgg/http.dart';
import 'package:expertgg/session/user.dart';

Future<User> loadUser() async {
  try {
    final response = await http.wst.get('player');
    if (response.statusCode == 200) {
      return User(
        username: response.data['username'],
        email: response.data['email'],
      );
    }
    return null;
  } catch (err) {
    print(err);
    return null;
  }
}
