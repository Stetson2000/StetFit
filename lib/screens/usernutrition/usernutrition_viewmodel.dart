import 'package:flutter/material.dart';
import 'package:stetfit/controllers/user_controller.dart';
import 'package:stetfit/models/meal.dart';
import 'package:stetfit/services/searchmeal/searchmeal_services.dart';

class UserNutritionViewModel with ChangeNotifier {
  SearchMealService searchMealService = SearchMealService();

  final user = UserController().user;
  List<dynamic> _mealsId = [];

  List<Meal?> meals = [];
  // List<Meal?> dummymeals = [];

  // void setMealsID(List<dynamic> mealsId) => _mealsId = mealsId;

  Future<List<Meal?>> getUserMeal() async {
    _mealsId = user?.meals;
    meals = [];
    for (var i = 0; i < _mealsId.length; i++) {
      if (!meals.contains(_mealsId[i])) {
        meals.add(await searchMealService.searchMealbyId(_mealsId[i]));
      }
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
}
