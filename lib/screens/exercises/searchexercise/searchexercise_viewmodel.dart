import 'package:flutter/cupertino.dart';
import 'package:stetfit/models/exercise.dart';
import 'package:stetfit/services/searchexercise/searchexercise_services.dart';

class SearchExerciseViewModel extends ChangeNotifier {
  List<Exercise?> exercises = [];
  SearchExerciseServices searchExerciseServices = SearchExerciseServices();

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

  getCategorizedMeals(int category) async => exercises =
      await searchExerciseServices.searchExerciseByCategory(category);
}
