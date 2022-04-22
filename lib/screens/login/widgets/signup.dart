import 'package:flutter/material.dart';
import 'package:stetfit/screens/login/login_view.dart';
import 'package:stetfit/screens/signup/signup_view.dart';

class SignUp extends StatelessWidget {
  final IconData? icon;

  const SignUp({
    Key? key,
    required this.icon,
  }) : super(key: key);
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
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context, SignUpScreen.routeName, (route) => false),
              child: const Text(
                'Sign Up',
                style: TextStyle(color: Color.fromRGBO(246, 197, 190, 1)),
              )),
        ],
      ),
    );
  }
}
