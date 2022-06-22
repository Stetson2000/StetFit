class ExerciseOrder {
  String? id;
  int? duration;

  ExerciseOrder({
    this.id,
    this.duration,
  });
  ExerciseOrder.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    duration = json['duration']?.toInt();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['duration'] = duration;
    return data;
  }
}

class Exercise {
  String? id;
  String? title;
  double? met;
  List<int?>? categories;
  String? imageUrl;
  String? description;

  Exercise(
      {this.id,
      this.title,
      this.met,
      this.categories,
      this.imageUrl,
      this.description});
  Exercise.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    title = json['title']?.toString();
    met = json['met']?.toDouble();
    if (json['categories'] != null) {
      final v = json['categories'];
      final arr0 = <int>[];
      v.forEach((v) {
        arr0.add(v.toInt());
      });
      categories = arr0;
    }
    imageUrl = json['imageUrl']?.toString();
    description = json['description']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    // data['id'] = id;
    data['title'] = title;
    data['met'] = met;
    if (categories != null) {
      final v = categories;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['categories'] = arr0;
    }
    data['imageUrl'] = imageUrl;
    data['description'] = description;
    return data;
  }
}
