import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stetfit/models/meal.dart';
import 'package:stetfit/screens/searchmeal/searchmeal_viewmodel.dart';

import '../../services/searchmeal/searchmeal_services.dart';

class AddMeal extends StatefulWidget {
  static const routeName = '/addmeal-screen';

  AddMeal({Key? key}) : super(key: key);

  @override
  State<AddMeal> createState() => _AddMealState();
}

class _AddMealState extends State<AddMeal> {
  Meal? meal;

  @override
  void didChangeDependencies() {
    final int? id = ModalRoute.of(context)!.settings.arguments as int?;

    Provider.of<SearchMealViewModel>(context, listen: false)
        .searchById(id)
        .then((rawmeal) => meal = rawmeal);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // print(meal?.id);
    // print(meal?.title);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(meal?.title ?? " No shit"),
      ),
    );
  }
}
