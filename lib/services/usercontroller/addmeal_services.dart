import '../rest.dart';
import '../../models/meal.dart';

class UserControllerServices extends Rest {
  Future<void> addMealToUser({int? mealId, int? userID}) async {
    await Rest.patch('users/$userID',data: mealId);
  }

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
