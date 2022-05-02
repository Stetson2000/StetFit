import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:stetfit/models/user.dart';
import 'package:stetfit/screens/login/login_view.dart';
import 'package:stetfit/screens/signup/signup_viewmodel.dart';
import 'package:stetfit/screens/signup/widgets/activitylevelButton.dart';
import 'package:stetfit/screens/signup/widgets/alignedgrid.dart';

import 'widgets/signupwith.dart';

class SignUpScreen5 extends StatefulWidget {
  const SignUpScreen5({Key? key}) : super(key: key);

  static const routeName = '/signup-screen5';

  @override
  State<SignUpScreen5> createState() => _SignUpScreen5State();
}

class _SignUpScreen5State extends State<SignUpScreen5> {
  int prospectivetargetweight = 60;
  // ActivityLevel activityLevel = ActivityLevel.sedentary;
  int activityLevel = 1;
  int? selectIndex = 0;
  // int prospectiveactivitylvl = 60;

  @override
  Widget build(BuildContext context) {
    // final Map<String?, dynamic> userInfo =
    //     ModalRoute.of(context)!.settings.arguments as Map<String?, dynamic>;

    SignUpViewModel signUpViewModel = context.watch<SignUpViewModel>();

    final size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: height,
        color: const Color.fromRGBO(83, 158, 138, 1),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10),
              height: height * (1 / 6),
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
                    height: height * (5 / 6) - 20,
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
                          const SizedBox(height: 5),
                          const Text(
                            'Please Choose Your Activity Level:',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 18, color: Colors.black54),
                          ),
                          const SizedBox(height: 10),
                          SingleChildScrollView(
                            child: Wrap(
                                runSpacing: 4,
                                spacing: 4,
                                alignment: WrapAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectIndex = 1;
                                      });
                                      activityLevel = 1;
                                    },
                                    child: ActivityLevelButton(
                                      title: 'Sedentary',
                                      selectedId: selectIndex,
                                      buttonId: 1,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectIndex = 2;
                                      });

                                      activityLevel = 2;
                                    },
                                    child: ActivityLevelButton(
                                      title: 'Lightly Active',
                                      selectedId: selectIndex,
                                      buttonId: 2,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectIndex = 3;
                                      });
                                      activityLevel = 3;
                                    },
                                    child: ActivityLevelButton(
                                      title: 'Moderately Active',
                                      selectedId: selectIndex,
                                      buttonId: 3,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectIndex = 4;
                                      });
                                      activityLevel = 4;
                                    },
                                    child: ActivityLevelButton(
                                      title: 'Highly Active',
                                      selectedId: selectIndex,
                                      buttonId: 4,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectIndex = 5;
                                      });
                                      activityLevel = 5;
                                    },
                                    child: ActivityLevelButton(
                                      title: 'Extra Active',
                                      selectedId: selectIndex,
                                      buttonId: 5,
                                    ),
                                  ),
                                ]),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Please Pick Your Target Weight in KG:',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 18, color: Colors.black54),
                          ),
                          NumberPicker(
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(15)),
                              value: prospectivetargetweight,
                              minValue: 45,
                              maxValue: 150,
                              onChanged: (value) {
                                setState(() => prospectivetargetweight = value);
                              }),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Center(
                                    child: Text('Already have an Account?'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: const [
                                        SignUpWith(icon: Icons.login),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 30),
                                padding: const EdgeInsets.all(10),
                                alignment: Alignment.centerRight,
                                child: FloatingActionButton(
                                    onPressed: () async {
                                      signUpViewModel.addIndex(
                                          'activitylevel', activityLevel);
                                      signUpViewModel.addIndex('targetweight',
                                          prospectivetargetweight);

                                      signUpViewModel.addUser();

                                      Navigator.pushNamedAndRemoveUntil(
                                          context,
                                          LoginScreen.routeName,
                                          (route) => false);
                                    },
                                    child: const Icon(Icons.done)),
                              ),
                            ],
                          )
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
