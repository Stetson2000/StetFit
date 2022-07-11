import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stetfit/screens/exercises/addexercise/addexercise_view.dart';
import 'package:stetfit/screens/exercises/searchexercise/searchexercise_viewmodel.dart';

class SearchExercise extends StatelessWidget {
  static const routeName = '/searchexercise-screen';
  const SearchExercise({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final categoryType = ModalRoute.of(context)!.settings.arguments as int?;
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: Provider.of<SearchExerciseViewModel>(context, listen: false)
              .getCategorizedMeals(categoryType!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasError) {
                return const Center(child: Text('An error has occured'));
              } else {
                return Consumer<SearchExerciseViewModel>(
                  builder: (context, viewmodel, _) => Container(
                    // margin: const EdgeInsets.only(top: 20),
                    height: height,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 8.0,
                      ),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Column(
                            children: viewmodel.exercises
                                .map(
                                  (exercise) => GestureDetector(
                                    onTap: () => Navigator.of(context)
                                        .pushNamed(AddExercise.routeName,
                                            arguments: exercise),
                                    child: Container(
                                        margin: const EdgeInsets.all(15),
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                                color: Colors.black)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              exercise?.title ?? '',
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Row(
                                              children: [
                                                const Icon(Icons
                                                    .accessibility_new_sharp),
                                                Text(
                                                    viewmodel.exerciseIntensity(
                                                        exercise!),
                                                    style: const TextStyle(
                                                        fontSize: 13)),
                                              ],
                                            ),
                                          ],
                                        )),
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            }
          },
        ));
  }
}
