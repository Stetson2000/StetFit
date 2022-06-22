import 'package:flutter/material.dart';
import 'package:stetfit/controllers/user_controller.dart';
import 'package:stetfit/models/meal.dart';
import 'package:stetfit/services/searchmeal/searchmeal_services.dart';

class UserFavoritesViewModel with ChangeNotifier {
  SearchMealService searchMealService = SearchMealService();

  final user = UserController().user;
  List<dynamic> _mealsId = [];

  List<Meal?> meals = [];

  Future<List<Meal?>> getUserMeal() async {
    _mealsId = user?.favoritemeals;
    meals = [];
    for (var i = 0; i < _mealsId.length; i++) {
      if (!meals.contains(_mealsId[i])) {
        meals.add(await searchMealService.searchMealbyId(_mealsId[i]));
      }
    }

    return meals;
  }
}
