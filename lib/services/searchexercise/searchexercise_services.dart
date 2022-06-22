import 'package:stetfit/models/exercise.dart';
import 'package:stetfit/services/rest.dart';

class SearchExerciseServices extends Rest {
  searchExerciseByCategory(int category) async {
    List<Exercise> exercises = [];
    List<Exercise> exercisesByCategory = [];
    final json = await Rest.get('exercises');

    if (json == null) return;

    for (var exercise in json) {
      exercises.add(Exercise.fromJson(exercise));

    }


    

    exercisesByCategory = exercises
        .where((exercise) => exercise.categories!.contains(category))
        .toList();

    return exercisesByCategory;
  }
}
