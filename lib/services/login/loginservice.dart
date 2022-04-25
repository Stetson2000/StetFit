import '../rest.dart';
import '../../models/user.dart';

class LoginService extends Rest {
  Future<User?> authenicate({String? username, String? password}) async {
    final json = await Rest.get('users?username=$username&&password=$password');
    if (json == null || json.length == 0) {
      return null;
    }
    final user = User.fromJson(json[0]);
    return user;
  }
}
