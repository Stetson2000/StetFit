import 'package:flutter/cupertino.dart';

import '../../services/signup/signup_services.dart';
import '../../models/user.dart';

class SignUpViewModel extends ChangeNotifier{
  User? user;
  SignUpService dataservice=SignUpService();
  Future<void> addUser(User user) async {
    await dataservice.addUser(user);
  }
}
