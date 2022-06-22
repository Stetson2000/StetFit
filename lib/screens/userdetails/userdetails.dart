import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stetfit/controllers/user_controller.dart';
import 'package:stetfit/models/user.dart';
import 'package:stetfit/screens/usernutrition/widgets/circlesymbol.dart';

class UserDetailsScreen extends StatelessWidget {
  static const routeName = '/userdetails-screen';

  const UserDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController userController = context.watch<UserController>();
    User user = UserController().user;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Your Details',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Text(
                'Hello ${user.fullname} , here you can find more about your Daily Calorie Needs.',
                textAlign: TextAlign.center,
                style: GoogleFonts.ubuntu(
                    fontSize: 19, fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(thickness: 2),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CircleSymbol(
                child: Text(
                  '${userController.userAmr} kcal',
                  style: TextStyle(fontSize: 20),
                ),
                width: 100,
                height: 100,
              ),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                // Note: Styles for TextSpans must be explicitly defined.
                // Child text spans will inherit styles from parent
                style: GoogleFonts.ubuntu(fontSize: 17, color: Colors.black),

                children: <TextSpan>[
                  const TextSpan(
                      text:
                          'Based on the information you have given which are  '),
                  TextSpan(
                      text: 'Age: ${user.age} ',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const TextSpan(text: ','),
                  TextSpan(
                      text: ' Weight: ${user.weight}',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const TextSpan(text: ','),
                  TextSpan(
                      text: ' Height: ${user.height} ',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const TextSpan(text: ','),
                  TextSpan(
                      text:
                          ' Activity Level: ${userController.activityLevelString} ',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const TextSpan(
                      text:
                          ', the amount of calories you need to consume to maintain your current weight is shown Above'),
                ],
              ),
            ),

            const Divider(thickness: 2),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CircleSymbol(
                child: Text(
                  '${userController.userGoal} kcal',
                  style: const TextStyle(fontSize: 20),
                ),
                width: 100,
                height: 100,
              ),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                // Note: Styles for TextSpans must be explicitly defined.
                // Child text spans will inherit styles from parent
                style: GoogleFonts.ubuntu(fontSize: 17, color: Colors.black),

                children: <TextSpan>[
                  const TextSpan(text: 'Based on the '),
                  TextSpan(
                      text: 'Target Weight: ${user.targetweight} ',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  // const TextSpan(text: ','),
                  // TextSpan(
                  //     text: ' Weight: ${user.weight}',
                  //     style: const TextStyle(fontWeight: FontWeight.bold)),
                  // const TextSpan(text: ','),
                  // TextSpan(
                  //     text: ' Height: ${user.height} ',
                  //     style: const TextStyle(fontWeight: FontWeight.bold)),
                  // const TextSpan(text: ','),
                  // TextSpan(
                  //     text:
                  //         ' Activity Level: ${userController.activityLevelString} ',
                  //     style: const TextStyle(fontWeight: FontWeight.bold)),
                  const TextSpan(
                      text:
                          ', the amount of calories you need to consume daily for'),
                  const TextSpan(
                      text: ' 3 Months ',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const TextSpan(text: 'to reach your goal is shown Above'),
                ],
              ),
            ),

            //  Text(
            //   'Based on the information you have given which are age:${user.age}, weight:${user.weight}, height:${user.height}',
            //   textAlign: TextAlign.center,
            //   style:
            //       GoogleFonts.ubuntu(fontSize: 19, fontWeight: FontWeight.bold),
            // ),
            const Divider(thickness: 2),
          ],
        ),
      ),
    );
  }
}
