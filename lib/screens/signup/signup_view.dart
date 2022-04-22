import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stetfit/models/user.dart';
import 'package:stetfit/providers/users.dart';

import '../signup/widgets/signupwith.dart';
import '../signup/widgets/userinput.dart';
import '../signup/signup_view2.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  static const routeName = '/signup-screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final fullnamecontroller = TextEditingController();

  final usernamecontroller = TextEditingController();

  final passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: const Color.fromRGBO(83, 158, 138, 1),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10),
              height: 173,
              child: Image.asset(
                'assets/images/StetFit-logos.jpeg',
                fit: BoxFit.fill,
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 490,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 20),
                          Container(
                            margin: const EdgeInsets.only(left: 15),
                            child: Text('Register Now !',
                                textAlign: TextAlign.left,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(height: 15),
                          UserInput(
                            userInput: fullnamecontroller,
                            hintTitle: 'Full Name',
                            keyboardType: TextInputType.name,
                            password: false,
                          ),
                          UserInput(
                            userInput: usernamecontroller,
                            hintTitle: 'Username',
                            keyboardType: TextInputType.emailAddress,
                            password: false,
                          ),
                          UserInput(
                            userInput: passwordcontroller,
                            hintTitle: 'Password',
                            keyboardType: TextInputType.visiblePassword,
                            password: true,
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.all(10),
                            alignment: Alignment.centerRight,
                            child: FloatingActionButton(
                                onPressed: () async {
                                  Map<String?, dynamic> prospectiveuserInfo = {
                                    'fullname': fullnamecontroller.text,
                                    'username': usernamecontroller.text,
                                    'password': passwordcontroller.text,
                                  };

                                  // print(prospectiveuserInfo['fullname']);
                                  // print(prospectiveuserInfo['username']);
                                  // print(prospectiveuserInfo['password']);
                                  Navigator.pushNamed(
                                      context, SignUpScreen2.routeName,
                                      arguments: prospectiveuserInfo);
                                },
                                child: const Icon(Icons.arrow_forward)),
                          ),
                          const Center(
                            child: Text('Already have an Account?'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                SignUpWith(icon: Icons.login),
                              ],
                            ),
                          ),
                          const Divider(thickness: 0, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
