import 'package:flutter/cupertino.dart';
import 'package:stetfit/models/meal.dart';
import 'package:stetfit/services/searchmeal/searchmeal_services.dart';

class UserMealsViewModel with ChangeNotifier {
  List<dynamic> _mealsId = [];
  SearchMealService searchMealService = SearchMealService();

  void setMealsID(List<dynamic> mealsId) => _mealsId = mealsId;
  
  Future<List<Meal?>> getUserMeal() async {
  
    List<Meal?> meals = [];
    for (var i = 0; i < _mealsId.length; i++) {
      meals.add(await searchMealService.searchMealbyId(_mealsId[i]));
    }
    notifyListeners();
  
    return meals;
  }
}
