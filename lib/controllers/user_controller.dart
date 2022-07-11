import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stetfit/models/exercise.dart';
import 'package:stetfit/models/meal.dart';
import 'package:stetfit/models/user.dart';
import 'package:stetfit/screens/login/login_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:stetfit/services/usercontroller/usercontroller_services.dart';

class UserController with ChangeNotifier {
  UserController._privateConstructor();

  //Singleton intiation
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

  clearUser() {
    _user = null;
    notifyListeners();
  }

  setFullName(String fullname) {
    _user?.setFullname(fullname);
    notifyListeners();
  }

  setAge(int age) {
    _user?.setAge(age);
    notifyListeners();
  }

  setHeight(int height) {
    _user?.setHeight(height);
    notifyListeners();
  }

  setWeight(int weight) {
    _user?.setWeight(weight);
    notifyListeners();
  }

  setTargetWeight(int targetWeight) {
    _user?.setTargetWeight(targetWeight);
    notifyListeners();
  }

  get user => _user;

  updateUserMeal(dynamic mealID) async {
    MealOrder mealOrder = MealOrder(id: mealID, day: DateTime.now().toString());
    _user?.meals?.add(mealOrder);
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

  addExercise(ExerciseOrder order) async {
    _user?.exercises?.add(order);
    await userControllerServices.addExerciseToUser(
        orders: _user?.exercises, userID: _user?.id);
    notifyListeners();
  }

  double get activityLevel {
    switch (_user?.activitylevel) {
      case 1:
        return 1.2;
      case 2:
        return 1.375;
      case 3:
        return 1.55;
      case 4:
        return 1.725;
      case 5:
        return 1.9;
      default:
        return 0;
    }
  }

  String get activityLevelString {
    switch (_user?.activitylevel) {
      case 1:
        return 'Sedentary';
      case 2:
        return 'Lightly Active';
      case 3:
        return 'Moderately Active';
      case 4:
        return 'Highly Active';
      case 5:
        return 'Extra Active';
      default:
        return '';
    }
  }

  get userAmr => _user?.gender == "Male"
      ? _user?.amr = (((66.47) +
                  // (13.75 * num.parse(_user?.weight?.toString() as String)  ) +
                  (13.75 * (_user?.weight as num)) +
                  (5.003 * (_user?.height as num)) -
                  (6.755 * (_user?.age as num))) *
              activityLevel)
          .round()
      : _user?.amr = (((655.1) +
                  (9.563 * (_user?.weight as num)) +
                  (1.850 * (_user?.height as num)) -
                  (4.676 * (_user?.age as num))) *
              activityLevel)
          .round();

  get userGoal {
    var diff = (_user?.targetweight as num) - (_user?.weight as num);
    var totalCaloriesToReachGoal = diff.abs() * 7700;
    var amountPerDay = totalCaloriesToReachGoal / 90;
    (diff < 0)
        ? _user?.goalInKcal = userAmr - amountPerDay
        : _user?.goalInKcal = userAmr + amountPerDay;
    return _user?.goalInKcal?.round();
  }

  Future<int?> get userConsumption async {
    List<Meal?> meals = [];

    var sum = 0;

    for (var mealorder in _user!.meals!) {
      meals.add(await userControllerServices.getUserMealbyId(mealorder.id));
      Meal? meal = meals.where((element) => element?.id == mealorder.id).first;
      sum += meal?.kcal ?? 0;
      _user?.calorieTaken = sum;
    }

    if (sum <= 0) {
      return 0;
    }
    return _user?.calorieTaken;
  }

  Future<int?> get userExerciseCalories async {
    List<Exercise?> exercises = [];

    double sum = 0;

    for (var order in _user!.exercises!) {
      exercises.add(await userControllerServices.getUserExercisebyId(order.id));
      Exercise? exercise =
          exercises.where((element) => element?.id == order.id).first;
      sum +=
          (order.duration! * ((exercise!.met!) * 3.5 * (_user!.weight!)) / 200);
    }

    return sum.toInt();
  }

  get userRemaining async => (_user!.goalInKcal! -
          (await userConsumption as num) +
          (await userExerciseCalories as num))
      .round();
}
