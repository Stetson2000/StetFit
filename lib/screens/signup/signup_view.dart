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
                          const SizedBox(height: 45),
                          UserInput(
                            userInput: fullnamecontroller,
                            hintTitle: 'Full Name',
                            keyboardType: TextInputType.name,
                          ),
                          UserInput(
                            userInput: usernamecontroller,
                            hintTitle: 'Username',
                            keyboardType: TextInputType.emailAddress,
                          ),
                          UserInput(
                            userInput: passwordcontroller,
                            hintTitle: 'Password',
                            keyboardType: TextInputType.visiblePassword,
                          ),

                          // Container(
                          //   height: 55,
                          //   // for an exact replicate, remove the padding.
                          //   // pour une réplique exact, enlever le padding.
                          //   padding: const EdgeInsets.only(
                          //       top: 5, left: 70, right: 70),
                          //   child: ElevatedButton(
                          //     style: ButtonStyle(
                          //         backgroundColor: MaterialStateProperty.all(
                          //             const Color.fromRGBO(246, 197, 190, 1))),
                          //     // shape: RoundedRectangleBorder(
                          //     //     borderRadius: BorderRadius.circular(25)),

                          //     onPressed: () {
                          //       print(usernamecontroller);
                          //       print(passwordcontroller);
                          //       // Provider.of<Users>(context, listen: false)
                          //       //     .addUser(User(

                          //       //         fullname: usernamecontroller.text,
                          //       //         password: passwordcontroller.text,
                          //       //         username: usernamecontroller.text));

                          //       // Navigator.of(context).push(MaterialPageRoute(
                          //       //     builder: (ctx) => SuccessfulScreen()));
                          //     },
                          //     child: const Text(
                          //       'Sign up',
                          //       style: TextStyle(
                          //         fontSize: 20,
                          //         fontWeight: FontWeight.w700,
                          //         color: Colors.white,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.all(10),
                            alignment: Alignment.centerRight,
                            child: FloatingActionButton(
                                onPressed: ()  async{
                                  Map<String?, dynamic> prospectiveuserInfo = {
                                    'fullname': fullnamecontroller.text,
                                    'username': usernamecontroller.text,
                                    'password': passwordcontroller.text,
                                  };

                                  // print(prospectiveuserInfo['fullname']);
                                  // print(prospectiveuserInfo['username']);
                                  // print(prospectiveuserInfo['password']);
                                  Navigator.pushNamed(context,
                                      SignUpScreen2.routeName,
                                      arguments: prospectiveuserInfo);
                                },
                                child: const Icon(Icons.arrow_forward)),
                          ),
                          const SizedBox(height: 2),
                          const Center(
                            child: Text('Forgot password ?'),
                          ),
                          const SizedBox(height: 2),
                          Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                SignUpWith(icon: Icons.add),
                                SignUpWith(icon: Icons.book_online),
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
