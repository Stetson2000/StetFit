import 'package:flutter/cupertino.dart';
import 'package:stetfit/services/searchmeal/searchmeal_services.dart';

import '../../models/meal.dart';

class SearchMealViewModel with ChangeNotifier {
  Meal? meal;
  List<Meal?> meals = [];
  SearchMealService service = SearchMealService();

  // Future<List<Meal?>> searchByTitle(String? title) async {
  //   meals = await service.searchMealbyTitle(title);
  //   notifyListeners();
  //   return meals;
  // }

  Future<List<Meal?>> searchByTitle(String? title) async {
    meals = await service.searchMealbyTitle(title);

    // for (var i = 0; i < entity?.length; i++) {
    //   meals.add(Meal.fromJson(json[i]))  ;
    // }
    // return meals.add(entity)

    notifyListeners();
    return meals;
  }

  Future<Meal?> searchById(int? id) async {
    meal = await service.searchMealbyId(id);

    // for (var i = 0; i < entity?.length; i++) {
    //   meals.add(Meal.fromJson(json[i]))  ;
    // }
    // return meals.add(entity)

    notifyListeners();
    return meal;
  }
}
