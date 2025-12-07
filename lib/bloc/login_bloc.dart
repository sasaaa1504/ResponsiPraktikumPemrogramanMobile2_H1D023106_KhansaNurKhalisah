import 'dart:convert';
import '../helpers/api.dart';
import '../helpers/api_url.dart';
import '../model/login.dart';
import '../helpers/user_info.dart';

class LoginBloc {
  static Future<Login> login({
    required String email,
    required String password,
  }) async {
    String apiUrl = ApiUrl.login;
    var body = {'email': email, 'password': password};

    var response = await Api.post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    var loginData = Login.fromJson(jsonObj);

    // Save session if login successful
    if (loginData.isSuccess && loginData.token != null) {
      await UserInfo.saveSession(
        token: loginData.token!,
        userId: loginData.userId ?? 0,
        userName: loginData.nama ?? '',
        userEmail: loginData.userEmail ?? email,
      );
    }

    return loginData;
  }
}
