import 'package:flutter/cupertino.dart';
import 'package:stetfit/controllers/user_controller.dart';
import 'package:stetfit/services/usercontroller/usercontroller_services.dart';

class UserProfileViewModel extends ChangeNotifier {
  Map<String, dynamic> updated = {};
  UserControllerServices userControllerServices = UserControllerServices();

  void addIndex(String key, dynamic value) => updated[key] = value;

  Future<int> updateUserProfile(String? userid) async {
    int response = await userControllerServices.updateUserProfile(
        updatedProfile: updated, userID: userid);

    return response;
  }
}
