import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stetfit/screens/usernutrition/usernutrition_viewmodel.dart';

import '../../../models/exercise.dart';

class FutureBuilderExerciseCard extends StatelessWidget {
  const FutureBuilderExerciseCard({Key? key}) : super(key: key);

  String exerciseIntensity(Exercise exercise) {
    if (exercise.met! <= 3.5) {
      return 'Light Intensity';
    } else if (exercise.met! <= 5.0) {
      return 'Moderate Intensity';
    } else if (exercise.met! <= 6.0) {
      return 'High Intensity';
    } else if (exercise.met! <= 8.3) {
      return 'Extreme Intensity';
    }

    return '';

  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return FutureBuilder(
      future: Provider.of<UserNutritionViewModel>(context, listen: false)
          .getUserExercises(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasError) {
            return const Center(child: Text('An error has occured'));
          } else {
            return Consumer<UserNutritionViewModel>(
              builder: (context, viewmodel, _) => Container(
                // margin: const EdgeInsets.only(top: 20),
                height: height * 0.3,
                child: Card(
                  margin: const EdgeInsets.all(10),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 8.0,
                    ),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 90, 157, 245),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15))),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                'Your Exercises',
                                style: GoogleFonts.ubuntu(fontSize: 26),
                              ),
                            )),
                        Column(
                          children: viewmodel.exercises
                              .map(
                                (exercise) => Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Row(
                                          // mainAxisAlignment:
                                          //     MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Text(
                                                exercise?.title ?? "test",
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Text(
                                                exerciseIntensity(exercise!) ,
                                              ),
                                            ),
                                            
                                            // const Divider()
                                          ],
                                        ),
                                        const Divider(),
                                      ],
                                    )),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        }
      },
    );
  }
}
