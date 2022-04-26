import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stetfit/screens/signup/signup_view3.dart';
import 'package:stetfit/screens/signup/signup_viewmodel.dart';

import './widgets/userinput.dart';
import './widgets/signupwith.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';

class SignUpScreen2 extends StatelessWidget {
  // final Map<String?,dynamic>? args;

  const SignUpScreen2({Key? key}) : super(key: key);

  static const routeName = '/signup-screen2';
  @override
  Widget build(BuildContext context) {
    SignUpViewModel signUpViewModel = context.watch<SignUpViewModel>();
    // if (ModalRoute.of(context)!.settings.arguments != null) {
    //   userInfo =
    // final Map<String?, dynamic> userInfo =
    //     ModalRoute.of(context)!.settings.arguments as Map<String?, dynamic>;

    // final String? username =
    //     ModalRoute.of(context)!.settings.arguments as String;
    // print(username);
    // print(userInfo['username']);
    // } else {
    //   userInfo = {'fullname': 'Test', 'username': 'Test', 'password': ' Test'};
    //   print(userInfo['username']);
    // }
    Gender? gender;
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

                          Container(
                            margin: const EdgeInsets.only(left: 30),
                            child: GenderPickerWithImage(
                              verticalAlignedText: true,
                              linearGradient: const LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 228, 239, 248),
                                    Color.fromARGB(255, 83, 240, 188)
                                  ],
                                  tileMode: TileMode.clamp,
                                  begin: Alignment.bottomRight,
                                  end: Alignment.topLeft,
                                  stops: [0.0, 1.0]),
                              selectedGender: Gender.Male,
                              selectedGenderTextStyle: const TextStyle(
                                  color: Color.fromARGB(255, 34, 34, 34),
                                  fontWeight: FontWeight.bold),
                              unSelectedGenderTextStyle: const TextStyle(
                                  color: Color.fromARGB(255, 66, 64, 64),
                                  fontWeight: FontWeight.normal),
                              onChanged: (Gender? choice) {
                                gender = choice;
                                // userInfo['gender'] = choice;

                                // print(userInfo['fullname']);
                                // print(userInfo['password']);
                                // print(userInfo['gender']);
                              },
                              equallyAligned: true,
                              animationDuration: Duration(milliseconds: 300),
                              isCircular: true,
                              // default : true,
                              opacityOfGradient: 0.25,
                              padding: const EdgeInsets.all(3),
                              size: 100, //default : 40
                            ),
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
                          //       print(emailController);
                          //       print(passwordController);
                          //       // Provider.of<Users>(context, listen: false)
                          //       //     .addUser(User(

                          //       //         fullname: emailController.text,
                          //       //         password: passwordController.text,
                          //       //         username: emailController.text));

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
                                onPressed: () {
                                  signUpViewModel.addIndex(
                                      'gender',
                                      (gender == Gender.Male)
                                          ? 'Male'
                                          : 'Female');

                                  Navigator.pushNamed(
                                    context,
                                    SignUpScreen3.routeName,
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
