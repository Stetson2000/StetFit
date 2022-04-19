import 'package:flutter/material.dart';
import 'package:stetfit/screens/signup/signup_view.dart';

class Login extends StatelessWidget {
  final IconData? icon;

  const Login({
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
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => SignUpScreen())),
              child: const Text('Login')),
        ],
      ),
    );
  }
}
