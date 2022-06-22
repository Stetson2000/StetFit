import 'package:flutter/cupertino.dart';

import '../../services/signup/signup_services.dart';
import '../../models/user.dart';

class SignUpViewModel extends ChangeNotifier {
  Map<String, dynamic> puser = {
    "exercises": [],
    "favoritemeals": [],
    "meals": []
  };

  void addIndex(String key, dynamic value) => puser[key] = value;


  SignUpService dataservice = SignUpService();
  Future<void> addUser() async {
    await dataservice.addUser(User.fromJson(puser));
  }
}
