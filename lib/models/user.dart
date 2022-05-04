import 'package:flutter/cupertino.dart';

enum ActivityLevel {
  sedentary,
  lightlyactivity,
  moderateactivity,
  highactivity,
  extractive,
}

class User with ChangeNotifier {
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
  int? calorieTaken;
  int? protienTaken;
  int? carbTaken;
  int? fatTaken;
  List<dynamic>? meals;

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
      this.calorieTaken,
      this.protienTaken,
      this.carbTaken,
      this.fatTaken,
      this.meals});

  setUsername(String full) => fullname = full;
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
      final arr0 = <dynamic>[];
      v.forEach((v) {
        arr0.add(v);
      });
      meals = arr0;
    } else if (json['meals'] == null) {
      meals = [];
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
      };
}
