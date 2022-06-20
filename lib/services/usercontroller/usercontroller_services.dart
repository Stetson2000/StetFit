import 'dart:convert';

import 'package:stetfit/models/exercise.dart';

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

  Future<void> updateUserFavorite(
      {dynamic updatedMeals, String? userID}) async {
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

  Future<void> addExerciseToUser(
      {List<ExerciseOrder>? orders, String? userID}) async {
    Map<String, dynamic> toJson() {
      final data = <String, dynamic>{};
      if (orders != null) {
        final v = orders;
        final arr0 = <ExerciseOrder?>[];
        v.forEach((v) {
          arr0.add(v);
        });
        data['exercises'] = arr0;
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

  Future<Exercise?> getUserExercisebyId(String? id) async {
    final json = await Rest.get('exercises/$id');

    if (json == null || json.length == 0) {
      return null;
    }

    return Exercise.fromJson(json);
  }

  Future<int> updateUserProfile(
      {dynamic updatedProfile, String? userID}) async {
    // Map<String, dynamic> toJson() {
    //   final data = <String, dynamic>{};
    //   if (updatedMeals != null) {
    //     final v = updatedMeals;
    //     final arr0 = [];
    //     v!.forEach((v) {
    //       arr0.add(v);
    //     });
    //     data['meals'] = arr0;
    //   }
    //   return data;
    // }

    final response = await Rest.patch('users/$userID', data: updatedProfile);
    if (response != null) {
      return 1;
    }
    return 0;
  }
}
