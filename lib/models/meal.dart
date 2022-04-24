// class Meal {
//   final dynamic id;
//   final String? title;
//   final String? grade;
//   final int? kcal;
//   final int? protein;
//   final int? carb;
//   final int? fat;

//   Meal(
//       {this.id,
//       this.title,
//       this.grade,
//       this.kcal,
//       this.protein,
//       this.carb,
//       this.fat});

//   Meal.fromJson(Map<String, dynamic> json)
//       : this(
//           id: json['id'],
//           title: json['title'],
//           grade: json['grade'],
//           kcal: json['kcal'],
//           protein: json['protein'],
//           carb: json['carb'],
//           fat: json['fat'],
//         );
// }

// import 'dart:convert';

class Meal {
  final dynamic id;
  final String? title;
  final String? grade;
  final int? kcal;
  final int? protein;
  final int? carb;
  final int? fat;

  Meal({
    this.id,
    this.title,
    this.grade,
    this.kcal,
    this.protein,
    this.carb,
    this.fat,
  });
  //  Meal.fromJsonList(Map<String, dynamic> json) {
  //   id = json['id']?.toInt();
  //   title = json['title']?.toString();
  //   grade = json['grade']?.toString();
  //   kcal = json['kcal']?.toInt();
  //   protein = json['protein']?.toInt();
  //   carb = json['carb']?.toInt();
  //   fat = json['fat']?.toInt();
  // }

  Meal.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id']?.toInt(),
          title: json['title']?.toString(),
          grade: json['grade']?.toString(),
          kcal: json['kcal']?.toInt(),
          protein: json['protein']?.toInt(),
          carb: json['carb']?.toInt(),
          fat: json['fat']?.toInt(),
        );

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['grade'] = grade;
    data['kcal'] = kcal;
    data['protein'] = protein;
    data['carb'] = carb;
    data['fat'] = fat;
    return data;
  }

}
