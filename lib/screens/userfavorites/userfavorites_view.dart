import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stetfit/controllers/user_controller.dart';
import 'package:stetfit/models/user.dart';
import 'package:stetfit/models/meal.dart';
import 'package:stetfit/screens/addmeal/meal_view.dart';
import 'package:stetfit/screens/searchmeal/widgets/mealitem.dart';

import 'package:stetfit/screens/userfavorites/userfavorites_viewmodel.dart';

class UserFavorites extends StatelessWidget {
  static const routeName = '/userfavorites-screen';

  const UserFavorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Favorites'),
        ),
        body: SingleChildScrollView(
          child: FutureBuilder(
            future: Provider.of<UserFavoritesViewModel>(context, listen: false)
                .getUserMeal(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (snapshot.hasError) {
                  return const Center(child: Text('An error has occured'));
                } else {
                  return Consumer<UserFavoritesViewModel>(
                    builder: (context, viewmodel, _) => Column(
                      children: viewmodel.meals
                          .map((meal) => GestureDetector(
                                onTap: () => Navigator.of(context).pushNamed(
                                    MealScreen.routeName,
                                    arguments: meal),
                                child: MealItem(
                                  title: meal?.title,
                                  imageUrl: meal?.imageUrl,
                                ),
                              ))
                          .toList(),
                    ),
                  );
                }
              }
            },
          ),
        ));
  }
}
