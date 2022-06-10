class Exercise {


  String? id;
  String? title;
  double? met;
  List<int?>? categrory;
  String? imageUrl;

  Exercise({
    this.id,
    this.title,
    this.met,
    this.categrory,
    this.imageUrl,
  });
  Exercise.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    title = json['title']?.toString();
    met = json['met']?.toDouble();
  if (json['categrory'] != null) {
  final v = json['categrory'];
  final arr0 = <int>[];
  v.forEach((v) {
  arr0.add(v.toInt());
  });
    categrory = arr0;
    }
    imageUrl = json['imageUrl']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['met'] = met;
    if (categrory != null) {
      final v = categrory;
      final arr0 = [];
  v!.forEach((v) {
  arr0.add(v);
  });
      data['categrory'] = arr0;
    }
    data['imageUrl'] = imageUrl;
    return data;
  }
}