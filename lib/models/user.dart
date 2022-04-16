import 'package:flutter/cupertino.dart';

class User with ChangeNotifier{
  final String? id;
  final String? name;
  final String? username;
  final String? password;


  User({this.id,this.name,this.password,this.username});


  
}
