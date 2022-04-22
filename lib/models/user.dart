import 'package:flutter/cupertino.dart';

enum ActivityLevel {
 sedentary,
 lightlyactivity, 
 moderateactivity,
 highactivity, 
 extractive, 
}


class User with ChangeNotifier {
  final dynamic id;
  final String? fullname;
  final String? username;
  final String? password;
  final String? gender;
  final int? age;
  final int? height;
  final int? weight;
  final int? targetweight;
  final int? activitylevel;
  final int? calorieTaken;
  final int? protienTaken;
  final int? carbTaken;
  final int? fatTaken;

  User({
    this.id,
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
  });

  User.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          fullname: json['fullname'],
          username: json['username'],
          password: json['password'],
          gender: json['gender'],
          age: json['age'],
          height: json['height'],
          weight: json['weight'],
          activitylevel: json['activitylevel'],
          targetweight: json['targetweight'],
        );
  Map<String, dynamic> toJson() => {
        'id': id,
        'fullname': fullname,
        'username': username,
        'password': password,
        'gender': gender,
        'age': age,
        'height': height,
        'weight': weight,
        'activitylevel': activitylevel,
        'targetweight': targetweight,
      };
}
