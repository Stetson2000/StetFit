import 'package:flutter/material.dart';
import 'package:stetfit/screens/addmeal/addmeal_view.dart';
import 'package:stetfit/screens/login/login_view.dart';
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

  final List<Widget> _widgets = const [AddMeal(), AddMeal()];
  @override
  Widget build(BuildContext context) {
    final User? user = ModalRoute.of(context)!.settings.arguments as User;
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
      body: _widgets[selectedIndex!],
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
