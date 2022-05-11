import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stetfit/controllers/user_controller.dart';
import 'package:stetfit/screens/addmeal/addmealtype_view.dart';
import 'package:stetfit/screens/login/login_view.dart';
import 'package:stetfit/screens/userdashboard/userdashboard_view.dart';
import 'package:stetfit/screens/usermeals/usermeals_view.dart';
import '../login/login_view.dart';

import '../../models/user.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? selectedIndex = 0;

  final List<Widget> _widgets = [const UserDashboard(), const AddMealType()];
  @override
  Widget build(BuildContext context) {
    // final User? user = ModalRoute.of(context)!.settings.arguments as User;
    UserController userController = context.watch<UserController>();
    final user = userController.user;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text("Welcome ${user?.fullname} ")),
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.of(context).popAndPushNamed(LoginScreen.routeName),
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Container(
          color: Colors.grey.withOpacity(0.05),
          // color: Colors.grey.withOpacity(0.2),
          // color: Colors.black,
          child: _widgets[selectedIndex!]),
      bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'Add Meals',
                backgroundColor: Colors.black)
          ],
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black26,
          currentIndex: selectedIndex!,
          backgroundColor: Theme.of(context).primaryColor,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          }),
    );
  }
}
