import 'dart:convert';

import '../rest.dart';
import '../../models/meal.dart';

class UserControllerServices extends Rest {
  Future<void> addMealToUser({dynamic updatedMeals, int? userID}) async {
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
      // Map data = {
      //   "meals":
      // };
    }

    await Rest.patch('users/$userID', data: toJson());
    // Future<User?> authenicate({String? username, String? password}) async {
    //   final json = await Rest.get('users?username=$username&&password=$password');
    //   if (json == null || json.length == 0) {
    //     return null;
    //   }
    //   final user = User.fromJson(json[0]);
    //   return user;
    // }

    // Future<>
  }
}
