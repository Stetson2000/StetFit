import 'package:flutter/cupertino.dart';

class User with ChangeNotifier {
  final String? id;
  final String? name;
  final String? username;
  final String? password;

  User({
    required this.id,
    required this.name,
    required this.password,
    required this.username,
  });

  User.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          name: json['name'],
          username: json['username'],
          password: json['password'],
        );
  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'username': username, 'password': password};
}
