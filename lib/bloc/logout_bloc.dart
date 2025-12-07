import '../helpers/user_info.dart';
import '../helpers/api.dart';
import '../helpers/api_url.dart';

class LogoutBloc {
  static Future<void> logout() async {
    try {
      // Call logout API if needed
      await Api.post(ApiUrl.logout, {});
    } catch (e) {
      // Continue with local logout even if API call fails
    } finally {
      // Always clear local session
      await UserInfo.clearSession();
    }
  }
}
