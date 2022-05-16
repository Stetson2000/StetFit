import 'package:flutter/material.dart';
import 'package:stetfit/controllers/user_controller.dart';
import 'package:stetfit/screens/usernutrition/widgets/circleSymbol.dart';
import 'package:stetfit/screens/usernutrition/widgets/futurebuildercard.dart';

class UserNutrition extends StatelessWidget {
  static const routeName = '/usernutrition-screen';
  const UserNutrition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController userController = UserController();

    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // color: Colors.black,
          Card(
            margin: const EdgeInsets.all(10),
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Container(
              padding: const EdgeInsets.all(15),
              alignment: Alignment.center,
              width: double.infinity,
              height: height * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // SizedBox(width: 0.05),
                      Container(
                          margin: const EdgeInsets.only(left: 15),
                          child: const Text('Goal')),
                      const SizedBox(width: 2),
                      const Text('Consumed'),
                      const Text('Exercise'),
                      const Text('Remaining'),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleSymbol(
                              child: Text('${userController.userGoal}')),
                          Text('-'),
                          CircleSymbol(child: Text('0000')),
                          Text('+'),
                          CircleSymbol(child: Text('0000')),
                          Text('='),
                          CircleSymbol(child: Text('0000')),
                        ]),
                  )
                ],
              ),
            ),
          ),

          FutureBuilderCard(),
        ],
      ),
    );
  }
}
