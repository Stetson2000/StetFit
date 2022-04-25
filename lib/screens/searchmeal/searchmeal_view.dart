import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stetfit/models/meal.dart';
import 'package:stetfit/screens/addmeal/addmeal_view.dart';
import 'package:stetfit/screens/searchmeal/searchmeal_viewmodel.dart';

class SearchMeal extends StatelessWidget {
  static const routeName = "/searchmeal-screen";

  SearchMeal({Key? key}) : super(key: key);

  List<Meal?> meals = [];

  TextEditingController userQuery = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Meal'),
      ),
      body: Consumer<SearchMealViewModel>(
        builder: (context, viewmodel, _) => Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment:
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.search,
                      size: 30,
                    ),
                    onPressed: () async {
                      meals = await viewmodel.searchByTitle(userQuery.text);
                      for (var i = 0; i < meals.length; i++) {
                        print(meals[i]?.title);
                      }
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    width: 200,
                    child: TextField(controller: userQuery),
                  ),
                  const IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.cancel,
                        size: 30,
                      ))
                ],
              ),
            ),
            Column(
                children: meals
                    .map((meal) => Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                            onTap: () => Navigator.pushNamed(
                                context, AddMeal.routeName,
                                arguments: meal?.id),
                            // print("tapped"),
                            leading: Text(meal?.id.toString() ?? ""),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  meal?.title ?? "",
                                ),
                                Text(
                                  meal?.kcal.toString() ?? " ",
                                ),
                                Text(
                                  meal?.grade ?? " ",
                                ),
                              ],
                            ))))
                    .toList()),
          ],
        ),
      ),
    );
  }
}
