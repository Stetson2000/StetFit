import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stetfit/controllers/user_controller.dart';
import 'package:stetfit/models/exercise.dart';
import 'package:stetfit/models/meal.dart';
import 'package:stetfit/services/searchmeal/searchmeal_services.dart';
import 'package:stetfit/services/usercontroller/usercontroller_services.dart';

class UserNutritionViewModel with ChangeNotifier {
  SearchMealService searchMealService = SearchMealService();
  UserControllerServices userControllerServices = UserControllerServices();

  final user = UserController().user;
  List<dynamic> mealsOrder = [];
  List<dynamic> _exerciseId = [];

  List<dynamic> meals = [];
  List<dynamic> dates = [];

  List<Exercise?> exercises = [];
  // List<Meal?> dummymeals = [];

  // void setMealsID(List<dynamic> mealsId) => _mealsId = mealsId;

  Future getUserMeal() async {
    mealsOrder = user?.meals;
    meals = [];
    dates=[];
    for (var i = 0; i < mealsOrder.length; i++) {
      if (!meals.contains(mealsOrder[i].id)) {
        // print(meals[i])
        meals.add(await searchMealService.searchMealbyId(mealsOrder[i].id));
      }
      dates.add((DateFormat.yMMMd().format(DateTime.parse(mealsOrder[i].day))));
      // else {
      //   meals.removeWhere((element) => _mealsId[i]);
      // }
    }

    // dummymeals.addAll(meals);

    // meals.removeRange(0, meals.length - 1);
    // print(meals.length);

    // notifyListeners();

    return meals;
  }

  Future<List<Exercise?>> getUserExercises() async {
    _exerciseId = user?.exercises;
    exercises = [];

    for (var order in user!.exercises!) {
      if (!exercises.contains(order)) {
        exercises
            .add(await userControllerServices.getUserExercisebyId(order.id));
      }
    }
    // print(exercises);
    return exercises;
  }

  // Future<int?> get userExerciseCalories async {
  //   List<Exercise?> exercises = [];

  //   double sum = 0;

  //   for (var order in _user!.exercises!) {
  //     exercises.add(await userControllerServices.getUserExercisebyId(order.id));
  //     Exercise? exercise =
  //         exercises.where((element) => element?.id == order.id).first;
  //     sum +=
  //         (order.duration! * ((exercise!.met!) * 3.5 * (_user!.weight!)) / 200);
  //   }

  //   return sum.toInt();
  // }
}
