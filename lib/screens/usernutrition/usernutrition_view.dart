import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stetfit/controllers/user_controller.dart';
import 'package:stetfit/screens/usernutrition/widgets/circleSymbol.dart';
import 'package:stetfit/screens/usernutrition/widgets/futurebuilder_exercise.dart';
import 'package:stetfit/screens/usernutrition/widgets/futurebuilder_meals.dart';

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
      appBar:
          AppBar(title: const Text('Nutrition Calculator'), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // color: Colors.black,
            Card(
              margin: const EdgeInsets.all(10),
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 230, 245, 90),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15))),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          'Your Nutrition',
                          style: GoogleFonts.ubuntu(fontSize: 26),
                        ),
                      )),
                  Container(
                    padding: const EdgeInsets.all(15),
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: height * 0.2,
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
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CircleSymbol(
                                        child:
                                            Text('${userController.userGoal}')),
                                    const Text('-'),
                                    FutureBuilder(
                                        future: userController.userConsumption,
                                        builder: (context, snapshot) {
                                          return CircleSymbol(
                                              child: Text(
                                                  '${snapshot.data ?? '000'}'));
                                        }),
                                    const Text('+'),
                                    FutureBuilder(
                                        future:
                                            userController.userExerciseCalories,
                                        builder: (context, snapshot) {
                                          return CircleSymbol(
                                              child: Text(
                                                  '${snapshot.data ?? '000'}'));
                                        }),
                                    const Text('='),
                                    FutureBuilder(
                                        future: userController.userRemaining,
                                        builder: (context, snapshot) {
                                          return CircleSymbol(
                                              child: Text(
                                                  '${snapshot.data ?? '000'}'));
                                        }),
                                  ]),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

             FutureBuilderMealCard(),
             FutureBuilderExerciseCard()
          ],
        ),
      ),
    );
  }
}
