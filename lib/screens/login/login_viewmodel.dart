import 'package:flutter/cupertino.dart';
import 'package:stetfit/services/login/loginservice.dart';
import '../../models/user.dart';

class LoginViewModel with ChangeNotifier {
  User? user;
  LoginService service = LoginService();

  Future<User?> login({String? username, String? password}) async {
    user = await service.authenicate(username: username, password: password);
    notifyListeners();
    return user;
  }
}
