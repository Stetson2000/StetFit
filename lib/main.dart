import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stetfit/providers/users.dart';
import 'package:stetfit/screens/homescreen/Dashboard.dart';
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
          primaryColor: const Color.fromRGBO(83, 158, 138, 1),
        ),
        home: SignUpScreen(),
        routes: {
          LoginScreen.routeName: (context) => LoginScreen(),
          SignUpScreen.routeName: (context) => SignUpScreen(),
          DashboardScreen.routeName:(context)=>DashboardScreen(),
        },
      ),
    );
  }
}
