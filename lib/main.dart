import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stetfit/providers/users.dart';
import 'package:stetfit/router.dart' as router;
import 'package:stetfit/screens/login/login_view.dart';

import 'package:stetfit/screens/login/login_viewmodel.dart';
import 'package:stetfit/screens/signup/signup_view.dart';

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
        initialRoute: LoginScreen.routeName,
        onGenerateRoute: router.createRoute,
      ),
    );
  }
}
