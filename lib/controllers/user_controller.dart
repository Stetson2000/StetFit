import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stetfit/models/meal.dart';
import 'package:stetfit/models/user.dart';
import 'package:stetfit/screens/login/login_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:stetfit/services/usercontroller/addmeal_services.dart';

class UserController with ChangeNotifier {
  UserController._privateConstructor();

  static final UserController _instance = UserController._privateConstructor();

  // static UserController get instance => _instance;
  factory UserController() {
    return _instance;
  }

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

  updateUserMeal(dynamic mealID) async {
    _user?.meals?.add(mealID);

    await userControllerServices.addMealToUser(
        userID: _user?.id, updatedMeals: _user?.meals);
    notifyListeners();
  }

  isFavorite(dynamic mealID) => _user?.favoritemeals?.contains(mealID);

  addUserFavorites(dynamic mealID) async {
    _user?.favoritemeals?.add(mealID);
    await userControllerServices.updateUserFavorite(
        userID: _user?.id, updatedMeals: _user?.favoritemeals);
    notifyListeners();
  }

  removeUserFavorites(dynamic mealID) async {
    _user?.favoritemeals?.removeWhere((element) => element == mealID);
    await userControllerServices.updateUserFavorite(
        userID: _user?.id, updatedMeals: _user?.favoritemeals);
    notifyListeners();
  }
}
