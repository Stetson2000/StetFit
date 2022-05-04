import '../rest.dart';
import '../../models/user.dart';

class SignUpService extends Rest {
  Future<User> addUser(User user) async {
    final json = await Rest.post('users', data: user.toJson());
    print('done');
    return User.fromJson(json);
  }
}
