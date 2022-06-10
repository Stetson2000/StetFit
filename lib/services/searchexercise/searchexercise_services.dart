import 'package:stetfit/services/rest.dart';

class SearchExerciseServices extends Rest { 


  searchMealByCategory (int category) async {

      final exercises = await Rest.get('exercises');
      

  }

}