import 'package:dio/dio.dart';
import 'package:expertgg/jwt.dart';

class LoginResponse {
  String jwt;
}

class ExpertHttp {
  final String _btsBaseUrl = 'http://localhost:3001/';
  final String _wstBaseUrl = 'http://localhost:3002/';

  Dio wst;
  Dio bts;

  login(String username, String password) async {
    Dio dio = Dio();
    final loginUrl = _wstBaseUrl + 'login';
    final data = {
      'username': username,
      'password': password,
    };
    return dio.post(loginUrl, data: data).then((response) async {
      return response.data['jwt'];
    });
  }

  logout() async {
    Dio dio = Dio();
    final logoutUrl = _wstBaseUrl + 'logout';
    return dio.get(logoutUrl).then((response) async {
      await removeToken();
      return response;
    });
  }

  getToken() async {
    var response = await Dio().get(_wstBaseUrl + 'user/jwt');
    return response.data['token'];
  }

  ExpertHttp() {
    wst = Dio(Options(baseUrl: _wstBaseUrl));
    bts = Dio(Options(baseUrl: _btsBaseUrl));

    wst.interceptor.request.onSend = (Options options) async {
      var token = await getToken();
      if (token == null) return options;

      var expiredAt = parseToken(token)["exp"];

      var now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      var hourBeforeExpired = now - 60 * 60;

      if (expiredAt < now) {
        return options;
      }

      if (expiredAt > now && expiredAt < hourBeforeExpired) {
        var token = await getToken();
        await setToken(token);
      }

      var glueSign = options.path.contains('?') ? '&' : '?';
      options.path = options.path + glueSign + 'jwt=' + token;
      return options;
    };
  }
}

ExpertHttp http = ExpertHttp();
