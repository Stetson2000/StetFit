import 'package:flutter/cupertino.dart';
import 'package:stetfit/models/meal.dart';
import 'package:stetfit/models/user.dart';
import 'package:stetfit/screens/login/login_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:stetfit/services/usercontroller/addmeal_services.dart';

class UserController with ChangeNotifier {
  User? _user;
  UserControllerServices userControllerServices = UserControllerServices();

  void setUser(user) => _user = user;


// addMeal({int ?mealId ,User ?user}){
// //  var addMealToUser = await
// }

  updateUserMeal(int? mealID) async{
       await userControllerServices.addMealToUser(userID: _user?.id,mealId: mealID);
        notifyListeners();
  } 
 
}
