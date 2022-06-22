import 'package:flutter/material.dart';
import 'package:stetfit/screens/addmeal/meal_view.dart';
import 'package:stetfit/screens/exercises/addexercise/addexercise_view.dart';
import 'package:stetfit/screens/exercises/addexercise/exercises_view.dart';
import 'package:stetfit/screens/exercises/searchexercise/searchexercise_view.dart';
import 'package:stetfit/screens/homescreen/homescreen_view.dart';
import 'package:stetfit/screens/login/login_view.dart';
import 'package:stetfit/screens/searchmeal/searchmeal_view.dart';
import 'package:stetfit/screens/signup/signup_view.dart';
import 'package:stetfit/screens/signup/signup_view2.dart';
import 'package:stetfit/screens/signup/signup_view3.dart';
import 'package:stetfit/screens/signup/signup_view4.dart';
import 'package:stetfit/screens/signup/signup_view5.dart';
import 'package:stetfit/screens/userdashboard/userdashboard_view.dart';
import 'package:stetfit/screens/userdetails/userdetails.dart';
import 'package:stetfit/screens/userfavorites/userfavorites_view.dart';
import 'package:stetfit/screens/usernutrition/usernutrition_view.dart';
import 'package:stetfit/screens/userprofile/userprofile_view.dart';

Route<dynamic> createRoute(RouteSettings? settings) {
  // final args = settings!.arguments as Map<String?,dynamic>;
  switch (settings!.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => LoginScreen(), settings: settings);
    case SignUpScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => SignUpScreen(), settings: settings);
    case SignUpScreen2.routeName:
      return MaterialPageRoute(
          builder: (context) => const SignUpScreen2(), settings: settings);
    case SignUpScreen3.routeName:
      return MaterialPageRoute(
          builder: (context) => const SignUpScreen3(), settings: settings);
    case SignUpScreen4.routeName:
      return MaterialPageRoute(
          builder: (context) => const SignUpScreen4(), settings: settings);
    case SignUpScreen5.routeName:
      return MaterialPageRoute(
          builder: (context) => const SignUpScreen5(), settings: settings);
    case HomeScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => const HomeScreen(), settings: settings);
    case UserFavorites.routeName:
      return MaterialPageRoute(
          builder: (context) => const UserFavorites(), settings: settings);
    case UserDetailsScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => const UserDetailsScreen(), settings: settings);
    case UserDashboard.routeName:
      return MaterialPageRoute(
          builder: (context) => const UserDashboard(), settings: settings);
    case UserNutrition.routeName:
      return MaterialPageRoute(
          builder: (context) => const UserNutrition(), settings: settings);
    case SearchMeal.routeName:
      return MaterialPageRoute(
          builder: (context) => SearchMeal(), settings: settings);
    case MealScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => const MealScreen(), settings: settings);
    case SearchExercise.routeName:
      return MaterialPageRoute(
          builder: (context) => const SearchExercise(), settings: settings);
    case AddExercise.routeName:
      return MaterialPageRoute(
          builder: (context) =>  AddExercise(), settings: settings);
  

    
  }

  return MaterialPageRoute(builder: (context) => LoginScreen());
}
