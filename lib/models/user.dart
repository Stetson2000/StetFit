import 'package:stetfit/models/exercise.dart';
import 'package:stetfit/models/meal.dart';

enum ActivityLevel {
  sedentary,
  lightlyactivity,
  moderateactivity,
  highactivity,
  extractive,
}

class User {
  dynamic id;
  String? fullname;
  String? username;
  String? password;
  String? gender;
  int? age;
  int? height;
  int? weight;
  int? targetweight;
  int? activitylevel;
  int? amr;
  double? goalInKcal;
  int? calorieTaken;
  int? protienTaken;
  int? carbTaken;
  int? fatTaken;
  List<MealOrder>? meals;
  List<dynamic>? favoritemeals;
  List<ExerciseOrder>? exercises;

  User(
      {this.id,
      required this.fullname,
      required this.username,
      required this.password,
      required this.gender,
      required this.age,
      required this.height,
      required this.weight,
      required this.targetweight,
      required this.activitylevel,
      this.amr,
      this.calorieTaken,
      this.protienTaken,
      this.carbTaken,
      this.fatTaken,
      this.meals,
      this.favoritemeals,
      this.exercises});

  setFullname(String full) => fullname = full;
  setAge(int updatedage) => age = updatedage;
  setWeight(int updatedWeight) => weight = updatedWeight;
  setHeight(int updatedHeight) => height = updatedHeight;
  setTargetWeight(int updatedTarget) => targetweight = updatedTarget;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    fullname = json['fullname']?.toString();
    username = json['username']?.toString();
    password = json['password']?.toString();
    gender = json['gender']?.toString();
    age = json['age']?.toInt();
    height = json['height']?.toInt();
    weight = json['weight']?.toInt();
    activitylevel = json['activitylevel']?.toInt();
    targetweight = json['targetweight']?.toInt();
    if (json['meals'] != null) {
      final v = json['meals'];
      final arr0 = <MealOrder>[];
      v.forEach((v) {
        arr0.add(MealOrder.fromJson(v));
      });
      meals = arr0;
    } else if (json['meals'] == null) {
      meals = [];
    }

    if (json['favoritemeals'] != null) {
      final v = json['favoritemeals'];
      final arr0 = <dynamic>[];
      v.forEach((v) {
        arr0.add(v);
      });
      favoritemeals = arr0;
    } else if (json['favoritemeals'] == null) {
      favoritemeals = [];
    }

    if (json['exercises'] != null) {
      final v = json['exercises'];
      final arr0 = <ExerciseOrder>[];
      v.forEach((v) {
        arr0.add(ExerciseOrder.fromJson(v));
      });
      exercises = arr0;
    }
  }
  Map<String, dynamic> toJson() => {
        'fullname': fullname,
        'username': username,
        'password': password,
        'gender': gender,
        'age': age,
        'height': height,
        'weight': weight,
        'activitylevel': activitylevel,
        'targetweight': targetweight,
        'meals': meals,
        'favoritemeals': favoritemeals,
        'exercises': exercises
      };
}
