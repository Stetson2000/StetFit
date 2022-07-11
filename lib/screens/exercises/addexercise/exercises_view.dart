import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stetfit/helpers/appcolors.dart';
import 'package:stetfit/screens/exercises/searchexercise/searchexercise_view.dart';
import 'package:stetfit/screens/searchmeal/searchmeal_view.dart';

Widget exerciseCategory(String title, double height) {
  return Card(
    elevation: 12,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: AppColors.getLinearGradientDouble(Colors.pink, Colors.orange),
      ),
      child: Container(
        height: height,
        padding: const EdgeInsets.all(10),
        child: Text(
          title,
          style: GoogleFonts.ubuntu(fontSize: 20, color: Colors.white),
        ),
      ),
    ),
  );
}

class ExerciseCategory extends StatelessWidget {
  const ExerciseCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return GridView(
        padding: const EdgeInsets.all(30),
        children: [
          GestureDetector(
              onTap: () => Navigator.of(context)
                  .pushNamed(SearchExercise.routeName, arguments: 1),
              child: exerciseCategory('Pectorial Muscles', height / 6)),
          GestureDetector(
              onTap: () => Navigator.of(context)
                  .pushNamed(SearchExercise.routeName, arguments: 2),
              child: exerciseCategory('Arms', height / 6)),
          GestureDetector(
              onTap: () => Navigator.of(context)
                  .pushNamed(SearchExercise.routeName, arguments: 3),
              child: exerciseCategory('Legs', height / 6)),
          GestureDetector(
              onTap: () => Navigator.of(context)
                  .pushNamed(SearchExercise.routeName, arguments: 4),
              child: exerciseCategory('Abs', height / 6)),
          GestureDetector(
              onTap: () => Navigator.of(context)
                  .pushNamed(SearchExercise.routeName, arguments: 5),
              child: exerciseCategory('Cardio', height / 6)),
          GestureDetector(
              onTap: () => Navigator.of(context)
                  .pushNamed(SearchExercise.routeName, arguments: 6),
              child: exerciseCategory('Shoulders', height / 6)),
        ],
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 5 / 4,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ));
  }
}
