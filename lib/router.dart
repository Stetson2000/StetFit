import 'package:flutter/material.dart';
import 'package:stetfit/screens/addmeal/meal_view.dart';
import 'package:stetfit/screens/homescreen/homescreen_view.dart';
import 'package:stetfit/screens/login/login_view.dart';
import 'package:stetfit/screens/searchmeal/searchmeal_view.dart';
import 'package:stetfit/screens/signup/signup_view.dart';
import 'package:stetfit/screens/signup/signup_view2.dart';
import 'package:stetfit/screens/signup/signup_view3.dart';
import 'package:stetfit/screens/signup/signup_view4.dart';
import 'package:stetfit/screens/signup/signup_view5.dart';

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
          builder: (context) => SignUpScreen2(), settings: settings);
    case SignUpScreen3.routeName:
      return MaterialPageRoute(
          builder: (context) => SignUpScreen3(), settings: settings);
    case SignUpScreen4.routeName:
      return MaterialPageRoute(
          builder: (context) => SignUpScreen4(), settings: settings);
    case SignUpScreen5.routeName:
      return MaterialPageRoute(
          builder: (context) => SignUpScreen5(), settings: settings);
    case HomeScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => HomeScreen(), settings: settings);
    case SearchMeal.routeName:
      return MaterialPageRoute(
          builder: (context) => SearchMeal(), settings: settings);
    case MealScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => MealScreen(), settings: settings);
  }

  return MaterialPageRoute(builder: (context) => LoginScreen());
}
