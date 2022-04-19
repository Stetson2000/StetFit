import 'package:flutter/material.dart';

import '../../models/user.dart';

class DashboardScreen extends StatelessWidget {
  static const routeName = '/MainDashboard-screen';

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User? user = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      appBar: AppBar(
        title: Text("${user?.id}"),
      ),
      body: null,
    );
  }
}
