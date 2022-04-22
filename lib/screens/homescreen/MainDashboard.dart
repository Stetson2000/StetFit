import 'package:flutter/material.dart';

import '../../models/user.dart';

class MainDashboardScreen extends StatelessWidget {
  static const routeName = '/MainDashboard-screen';

  const MainDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User? user = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      appBar: AppBar(
        title: Text("${user?.fullname}"),
      ),
      body: null,
    );
  }
}
