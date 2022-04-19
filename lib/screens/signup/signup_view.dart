import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stetfit/models/user.dart';
import 'package:stetfit/providers/users.dart';

import '../signup/widgets/signupwith.dart';
import '../signup/widgets/userinput.dart';

class SignUpScreen extends StatelessWidget {
  
  SignUpScreen({Key? key}) : super(key: key);
  
  static const routeName = '/signup-screen';

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
                            userInput: emailController,
                            hintTitle: 'Email',
                            keyboardType: TextInputType.emailAddress,
                          ),
                          UserInput(
                            userInput: passwordController,
                            hintTitle: 'Password',
                            keyboardType: TextInputType.visiblePassword,
                          ),
                          Container(
                            height: 55,
                            // for an exact replicate, remove the padding.
                            // pour une réplique exact, enlever le padding.
                            padding: const EdgeInsets.only(
                                top: 5, left: 70, right: 70),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color.fromRGBO(246, 197, 190, 1))),
                              // shape: RoundedRectangleBorder(
                              //     borderRadius: BorderRadius.circular(25)),

                              onPressed: () {
                                print(emailController);
                                print(passwordController);
                                Provider.of<Users>(context, listen: false)
                                    .addUser(User(
                                      
                                        name: emailController.text,
                                        password: passwordController.text,
                                        username: emailController.text));

                                // Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (ctx) => SuccessfulScreen()));
                              },
                              child: const Text(
                                'Sign up',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Center(
                            child: Text('Forgot password ?'),
                          ),
                          const SizedBox(height: 20),
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
