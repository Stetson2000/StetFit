import 'package:flutter/material.dart';
import 'package:stetfit/screens/login/login_view.dart';

class SignUpWith extends StatelessWidget {
  final IconData? icon;

  const SignUpWith({Key? key, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 115,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.4), width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    LoginScreen.routeName, (route) => false);
              },
              child: Text(
                'Login',
                style: TextStyle(color: Theme.of(context).primaryColor),
              )),
        ],
      ),
    );
  }
}
