import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stetfit/screens/usernutrition/usernutrition_viewmodel.dart';

class FutureBuilderCard extends StatelessWidget {
  const FutureBuilderCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return FutureBuilder(
      future: Provider.of<UserNutritionViewModel>(context, listen: false)
          .getUserMeal(),
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
                                color: Color.fromARGB(255, 245, 90, 90),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15))),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                'Your Meals',
                                style: GoogleFonts.ubuntu(fontSize: 26),
                              ),
                            )),
                        Column(
                          children: viewmodel.meals
                              .map(
                                (meal) => Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              meal?.title ?? "test",
                                            ),
                                            Text(
                                              meal?.kcal.toString() ?? " ",
                                            ),
                                            Text(
                                              meal?.grade ?? " ",
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
