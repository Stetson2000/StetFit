import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:stetfit/screens/signup/signup_view4.dart';

class SignUpScreen3 extends StatefulWidget {
  const SignUpScreen3({Key? key}) : super(key: key);

  static const routeName = '/signup-screen3';

  @override
  State<SignUpScreen3> createState() => _SignUpScreen3State();
}

class _SignUpScreen3State extends State<SignUpScreen3> {
  int prospectiveuserage = 18;
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
                              value: prospectiveuserage,
                              minValue: 15,
                              maxValue: 60,
                              onChanged: (value) {
                                setState(() => prospectiveuserage = value);
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
                                onPressed: () => Navigator.pushNamed(
                                    context, SignUpScreen4.routeName),
                                child: const Icon(Icons.arrow_forward)),
                          ),
                          const SizedBox(height: 10),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                // SignUpWith(icon: Icons.add),
                                // SignUpWith(icon: Icons.book_online),
                              ],
                            ),
                          ),
                          const Divider(thickness: 0, color: Colors.white),
                          /*
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //Text('Don\'t have an account yet ? ', style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),),
                          TextButton(
                          onPressed: () {},
                          child: Text(
                            'Sign Up',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                        ),
                        ],
                      ),
                        */
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
