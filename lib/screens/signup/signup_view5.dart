import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:stetfit/models/user.dart';
import 'package:stetfit/screens/signup/widgets/activitylevelButton.dart';
import 'package:stetfit/screens/signup/widgets/alignedgrid.dart';

class SignUpScreen5 extends StatefulWidget {
  const SignUpScreen5({Key? key}) : super(key: key);

  static const routeName = '/signup-screen5';

  @override
  State<SignUpScreen5> createState() => _SignUpScreen5State();
}

class _SignUpScreen5State extends State<SignUpScreen5> {
  int prospectivetargetweight = 160;
  int prospectiveactivitylvl = 60;

  @override
  Widget build(BuildContext context) {
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
                          // Container(
                          //     margin: const EdgeInsets.only(
                          //         left: 45, right: 45, top: 15),
                          //     alignment: Alignment.center,
                          //     child: const Divider(
                          //       thickness: 2,
                          //     )),
                          // Container(
                          //   alignment: Alignment.center,
                          //   height: 400,
                          //   child: GridView(
                          //     padding: const EdgeInsets.all(30),
                          //     children: const [

                          //     ],
                          //     gridDelegate:
                          //         const SliverGridDelegateWithMaxCrossAxisExtent(
                          //       maxCrossAxisExtent: 150,2
                          //       childAspectRatio: 1.5,
                          //       crossAxisSpacing: 20,
                          //       mainAxisSpacing: 20,
                          //     ),
                          //   ),
                          // ),
                          AlignedGrid(),
                          const SizedBox(height: 10),
                          // Container(
                          //     margin:
                          //         const EdgeInsets.only(left: 50, right: 50),
                          //     alignment: Alignment.center,
                          //     child: const Divider(
                          //       thickness: 2,
                          //     )),
                          const Text(
                            'Please Pick Your Target Weight in KG:',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 18, color: Colors.black54),
                          ),
                          // Container(
                          //     margin: const EdgeInsets.only(
                          //         left: 45, right: 45, top: 15),
                          //     alignment: Alignment.center,
                          //     child: const Divider(
                          //       thickness: 2,
                          //     )),
                          NumberPicker(
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(15)),
                              value: 50,
                              minValue: 45,
                              maxValue: 150,
                              onChanged: (value) {
                                // setState(() => prospectiveuserweight = value);
                              }),
                          Container(
                            padding: const EdgeInsets.all(10),
                            alignment: Alignment.centerRight,
                            child: FloatingActionButton(
                                onPressed: () => Navigator.pushNamed(
                                    context, SignUpScreen5.routeName),
                                child: const Icon(Icons.arrow_forward)),
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
