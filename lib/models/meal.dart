class MealOrder {
  String? id;
  String? day;

  MealOrder({
    this.id,
    this.day
  });
  MealOrder.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    day = json['day']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['day'] = day;
    return data;
  }
}

class Meal {
  final dynamic id;
  final double? grams;
  final String? title;
  final String? grade;
  final int? kcal;
  final double? protein;
  final double? carb;
  final double? fat;
  final String? imageUrl;

  Meal(
      {this.id,
      this.grams,
      this.title,
      this.grade,
      this.kcal,
      this.protein,
      this.carb,
      this.fat,
      this.imageUrl});
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
          id: json['id']?.toString(),
          grams: json['grams']?.toDouble(),
          title: json['title']?.toString(),
          grade: json['grade']?.toString(),
          kcal: json['kcal']?.toInt(),
          protein: json['protein']?.toDouble(),
          carb: json['carb']?.toDouble(),
          fat: json['fat']?.toDouble(),
          imageUrl: json['imageUrl']?.toString(),
        );

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['grams'] = grams;
    data['title'] = title;
    data['grade'] = grade;
    data['kcal'] = kcal;
    data['protein'] = protein;
    data['carb'] = carb;
    data['fat'] = fat;
    data['imageUrl'] = imageUrl;
    return data;
  }
}
