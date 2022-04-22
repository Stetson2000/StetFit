import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stetfit/providers/users.dart';
import 'package:stetfit/router.dart' as router;
import 'package:stetfit/screens/login/login_view.dart';

import 'package:stetfit/screens/login/login_viewmodel.dart';
import 'package:stetfit/screens/signup/signup_view.dart';
import 'package:stetfit/screens/signup/signup_view2.dart';
import 'package:stetfit/screens/signup/signup_view3.dart';
import 'package:stetfit/screens/signup/signup_view4.dart';
import 'package:stetfit/screens/signup/signup_view5.dart';
import 'package:stetfit/screens/signup/signup_viewmodel.dart';

import 'screens/homescreen/MainDashboard.dart';

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
        ChangeNotifierProvider(create: (context) => Users()),
        ChangeNotifierProvider(create: (context) => LoginViewModel()),
        ChangeNotifierProvider(create: (context) => SignUpViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            fontFamily: 'Lato',
            primaryColor: const Color.fromRGBO(83, 158, 138, 1),
            textTheme: ThemeData.light().textTheme.copyWith(
                    headline6: const TextStyle(
                  fontFamily: 'Lato',
                )),
            appBarTheme: const AppBarTheme(
                color: Color.fromRGBO(83, 158, 138, 1),
                titleTextStyle: TextStyle(fontWeight: FontWeight.bold)),
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Color.fromARGB(255, 248, 209, 93))),
          home: SignUpScreen(),
          routes: {
            LoginScreen.routeName: (context) => LoginScreen(),
          SignUpScreen.routeName: (context) => SignUpScreen(),
          SignUpScreen2.routeName: (context) => SignUpScreen2(),
          SignUpScreen3.routeName: (context) => SignUpScreen3(),
          SignUpScreen4.routeName: (context) => SignUpScreen4(),
          SignUpScreen5.routeName: (context) => SignUpScreen5(),
          MainDashboardScreen.routeName:(context)=>MainDashboardScreen(),
          },

        // initialRoute: SignUpScreen.routeName,
        // onGenerateRoute: router.createRoute,
      ),
    );
  }
}
