import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:stetfit/screens/signup/signup_view4.dart';
import 'package:stetfit/screens/signup/signup_viewmodel.dart';

import 'widgets/signupwith.dart';

class SignUpScreen3 extends StatefulWidget {
  const SignUpScreen3({Key? key}) : super(key: key);

  static const routeName = '/signup-screen3';

  @override
  State<SignUpScreen3> createState() => _SignUpScreen3State();
}

class _SignUpScreen3State extends State<SignUpScreen3> {
  int prospectiveUserAge = 18;
  @override
  Widget build(BuildContext context) {
    SignUpViewModel signUpViewModel = context.watch<SignUpViewModel>();

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
                                        height: MediaQuery.of(context).size.height * .77,

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
                          const SizedBox(height: 45),
                          const Text(
                            'Please Pick Your Age:',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18),
                          ),
                          Container(
                              margin: const EdgeInsets.only(
                                  left: 45, right: 45, top: 15),
                              alignment: Alignment.center,
                              child: const Divider(
                                thickness: 2,
                              )),
                          NumberPicker(
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(15)),
                              value: prospectiveUserAge,
                              minValue: 15,
                              maxValue: 60,
                              onChanged: (value) {
                                setState(() => prospectiveUserAge = value);
                              }),
                          const SizedBox(height: 10),
                          Container(
                              margin:
                                  const EdgeInsets.only(left: 50, right: 50),
                              alignment: Alignment.center,
                              child: const Divider(
                                thickness: 2,
                              )),
                          Container(
                            padding: const EdgeInsets.all(10),
                            alignment: Alignment.centerRight,
                            child: FloatingActionButton(
                                onPressed: () {
                                  signUpViewModel.addIndex(
                                      'age', prospectiveUserAge);

                                  Navigator.pushNamed(
                                    context,
                                    SignUpScreen4.routeName,
                                  );
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
