import 'dart:convert';

import '../rest.dart';
import '../../models/meal.dart';

class UserControllerServices extends Rest {
  Future<void> addMealToUser({dynamic updatedMeals, String? userID}) async {
    Map<String, dynamic> toJson() {
      final data = <String, dynamic>{};
      if (updatedMeals != null) {
        final v = updatedMeals;
        final arr0 = [];
        v!.forEach((v) {
          arr0.add(v);
        });
        data['meals'] = arr0;
      }
      return data;
    }

    await Rest.patch('users/$userID', data: toJson());
  }

  Future<void> updateUserFavorite({dynamic updatedMeals, String? userID}) async {
    Map<String, dynamic> toJson() {
      final data = <String, dynamic>{};
      if (updatedMeals != null) {
        final v = updatedMeals;
        final arr0 = [];
        v!.forEach((v) {
          arr0.add(v);
        });
        data['favoritemeals'] = arr0;
      }
      return data;
    }

    await Rest.patch('users/$userID', data: toJson());
  }

  Future<Meal?> getUserMealbyId(String? id) async {
    final json = await Rest.get('meals/$id');

    if (json == null || json.length == 0) {
      return null;
    }

    return Meal.fromJson(json);
  }
}
