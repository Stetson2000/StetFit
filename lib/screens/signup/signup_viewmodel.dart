import '../../services/signup/signup_services.dart';
import '../../models/user.dart';

class SignUpViewModel {
  User? user;
  SignUpService? dataservice;
  Future<void> addUser(User user) async {
    dataservice!.addUser(user);
  }
}
