import 'package:flutter/material.dart';
import 'package:stetfit/screens/homescreen/MainDashboard.dart';
import 'package:stetfit/screens/login/login_view.dart';
import 'package:stetfit/screens/signup/signup_view.dart';
import 'package:stetfit/screens/signup/signup_view2.dart';
import 'package:stetfit/screens/signup/signup_view3.dart';
import 'package:stetfit/screens/signup/signup_view4.dart';
import 'package:stetfit/screens/signup/signup_view5.dart';

Route<dynamic> createRoute(RouteSettings? settings) {
  // final args = settings!.arguments as Map<String?,dynamic>;
  switch (settings!.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case SignUpScreen.routeName:
      return MaterialPageRoute(builder: (context) => SignUpScreen());
    case SignUpScreen2.routeName:
      return MaterialPageRoute(builder: (context) =>  SignUpScreen2());
    case SignUpScreen3.routeName:
      return MaterialPageRoute(builder: (context) => SignUpScreen3());
    case SignUpScreen4.routeName:
      return MaterialPageRoute(builder: (context) => SignUpScreen4());
    case SignUpScreen5.routeName:
      return MaterialPageRoute(builder: (context) => SignUpScreen5());
    case MainDashboardScreen.routeName:
      return MaterialPageRoute(builder: (context) => MainDashboardScreen());
  }

  return MaterialPageRoute(builder: (context) => LoginScreen());
}
