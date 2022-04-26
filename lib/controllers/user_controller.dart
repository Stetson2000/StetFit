import 'package:flutter/cupertino.dart';
import 'package:stetfit/models/meal.dart';
import 'package:stetfit/models/user.dart';
import 'package:stetfit/screens/login/login_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:stetfit/services/usercontroller/addmeal_services.dart';

class UserController with ChangeNotifier {
  User? _user;
  UserControllerServices userControllerServices = UserControllerServices();

  void setUser(user) {
    _user = user;
    notifyListeners();
  }

  void setUserName(String fullname) {
    _user?.setUsername(fullname);
    notifyListeners();
  }

  get user => _user;

// addMeal({int ?mealId ,User ?user}){
// //  var addMealToUser = await
// }

  updateUserMeal(int? mealID) async {
    _user?.meals?.add(mealID);
    await userControllerServices.addMealToUser(
        userID: _user?.id, updatedMeals: _user?.meals);
    notifyListeners();
  }
}
