import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

const _jwtField = 'jwt';

Future<String> getToken() async {
  var prefs = await _getSharedPrefs();
  var token = prefs.getString(_jwtField);
  if (token == null || isTokenExpired(token)) return null;
  return token;
}

Future<bool> setToken(String jwt) async {
  var prefs = await _getSharedPrefs();
  return prefs.setString(_jwtField, jwt);
}

Future<void> removeToken() async {
  var prefs = await _getSharedPrefs();
  return prefs.remove(_jwtField);
}

bool isTokenExpired(String jwt) {
  var parsedJwt = parseToken(jwt);
  return (parsedJwt["exp"] > DateTime.now().millisecondsSinceEpoch);
}

Map<String, dynamic> parseToken(String token) {
  final parts = token.split('.');
  if (parts.length != 3) {
    throw Exception('invalid token');
  }

  final payload = _decodeBase64(parts[1]);
  final payloadMap = json.decode(payload);
  if (payloadMap is! Map<String, dynamic>) {
    throw Exception('invalid payload');
  }

  return payloadMap;
}

Future<SharedPreferences> _getSharedPrefs() {
  return SharedPreferences.getInstance();
}

String _decodeBase64(String str) {
  String output = str.replaceAll('-', '+').replaceAll('_', '/');

  switch (output.length % 4) {
    case 0:
      break;
    case 2:
      output += '==';
      break;
    case 3:
      output += '=';
      break;
    default:
      throw Exception('Illegal base64url string!"');
  }

  return utf8.decode(base64Url.decode(output));
}
