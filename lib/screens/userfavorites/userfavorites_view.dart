import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stetfit/controllers/user_controller.dart';
import 'package:stetfit/models/user.dart';
import 'package:stetfit/models/meal.dart';
import 'package:stetfit/screens/addmeal/meal_view.dart';
import 'package:stetfit/screens/searchmeal/widgets/mealitem.dart';

import 'package:stetfit/screens/userfavorites/userfavorites_viewmodel.dart';
import 'package:stetfit/screens/usermeals/usermeals_viewmodel.dart';

class UserFavorites extends StatefulWidget {
  static const routeName = '/userfavorites-screen';

  const UserFavorites({Key? key}) : super(key: key);

  @override
  State<UserFavorites> createState() => _UserFavoritesState();
}

class _UserFavoritesState extends State<UserFavorites> {
  // Future<List<Meal?>>? favorites;

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // UserController userController = context.watch<UserController>();
    // UserFavoritesViewModel userFavoritesViewModel =
    //     context.watch<UserFavoritesViewModel>();
    // final User user = userController.user;

    // userFavoritesViewModel.setMealsID(user.favoritemeals!);
    // List<Meal?> favorites = [];
    // Provider.of<UserFavoritesViewModel>(context, listen: false)
    //     .getUserMeal()
    //     .then((value) => favorites = value);

    // print(favorites.length);

    // @override
    // void didChangeDependencies() {

    // }

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

/*
Consumer<UserFavoritesViewModel>(
          builder: (context, viewmodel, _) => Column(
            children: favorites.map((e) => Text(e?.title ?? " ")).toList(),
          ),
        )
*/