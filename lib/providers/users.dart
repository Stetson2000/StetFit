import 'package:flutter/cupertino.dart';
import 'package:stetfit/models/user.dart';
import 'package:stetfit/screens/signup/signup_view.dart';
import 'package:stetfit/services/signup/signup_services.dart';


class Users  with ChangeNotifier {


  List<User> users = [];


  List<User> get user=>[...users];
   

   

}