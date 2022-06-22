import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stetfit/controllers/user_controller.dart';
// import 'package:stetfit/providers/users.dart';
import 'package:stetfit/router.dart' as router;
import 'package:stetfit/screens/addmeal/meal_view.dart';
import 'package:stetfit/screens/exercises/searchexercise/searchexercise_viewmodel.dart';
// import 'package:stetfit/screens/addmeal/meal_viewmodel.dart';
import 'package:stetfit/screens/login/login_view.dart';

import 'package:stetfit/screens/login/login_viewmodel.dart';
import 'package:stetfit/screens/searchmeal/searchmeal_viewmodel.dart';
import 'package:stetfit/screens/signup/signup_view.dart';
import 'package:stetfit/screens/signup/signup_view2.dart';
import 'package:stetfit/screens/signup/signup_view3.dart';
import 'package:stetfit/screens/signup/signup_view4.dart';
import 'package:stetfit/screens/signup/signup_view5.dart';
import 'package:stetfit/screens/signup/signup_viewmodel.dart';
import 'package:stetfit/screens/userfavorites/userfavorites_viewmodel.dart';
import 'package:stetfit/screens/usernutrition/usernutrition_viewmodel.dart';
import 'package:stetfit/screens/userprofile/userprofile_viewmodel.dart';
import 'package:stetfit/services/searchmeal/searchmeal_services.dart';
import 'package:stetfit/services/usercontroller/usercontroller_services.dart';

import 'screens/homescreen/homescreen_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (context) => Users()),
        ChangeNotifierProvider(create: (context) => LoginViewModel()),
        ChangeNotifierProvider(create: (context) => SignUpViewModel()),
        ChangeNotifierProvider(create: (context) => SearchMealViewModel()),
        ChangeNotifierProvider(create: (context) => UserController()),
        // ChangeNotifierProvider(create: (context) => UserMealsViewModel()),
        ChangeNotifierProvider(create: (context) => UserFavoritesViewModel()),
        ChangeNotifierProvider(create: (context) => UserNutritionViewModel()),
        ChangeNotifierProvider(create: (context) => SearchExerciseViewModel()),
        ChangeNotifierProvider(create: (context) => UserProfileViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            backgroundColor: Colors.amber,
            fontFamily: 'Lato',
            primaryColor: const Color.fromRGBO(83, 158, 138, 1),
            textTheme: ThemeData.light().textTheme.copyWith(
                    headline6: const TextStyle(
                  fontFamily: 'Lato',
                )),
            appBarTheme: const AppBarTheme(
                color: Color.fromRGBO(83, 158, 138, 1),
                titleTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lato',
                    fontSize: 18)),
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Color.fromARGB(255, 248, 209, 93))),
      
        initialRoute: LoginScreen.routeName,
        onGenerateRoute: router.createRoute,
      ),
    );
  }
}
