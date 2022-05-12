import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stetfit/controllers/user_controller.dart';
import 'package:stetfit/models/meal.dart';
// import 'package:stetfit/screens/addmeal/meal_viewmodel.dart';
import 'package:stetfit/screens/searchmeal/searchmeal_viewmodel.dart';
import 'package:stetfit/services/usercontroller/addmeal_services.dart';

import '../../services/searchmeal/searchmeal_services.dart';

class MealScreen extends StatelessWidget {
  static const routeName = '/addmeal-screen';

  const MealScreen({Key? key}) : super(key: key);

  Widget buildTitle(BuildContext ctx, String title) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          style: Theme.of(ctx).textTheme.headline6,
        ));
  }

  Widget buildContainer(Widget widget) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 150,
        width: 300,
        child: widget);
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal?;

    // MealViewModel mealviewmodel = context.watch<MealViewModel>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: Navigator.of(context).pop),
        automaticallyImplyLeading: false,
        title: Text(meal?.title?.toLowerCase() ?? " "),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 4,
                  )),
              margin: const EdgeInsets.all(15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  'assets/images/${meal?.imageUrl?.toString()}',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            buildTitle(context, 'Nutritional Information'),
            buildContainer(Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                        child: Text(' ${meal?.protein?.toString() ?? " "} G'),
                        backgroundColor: Colors.amber,
                        radius: 25),
                    CircleAvatar(
                        child: Text(' ${meal?.carb?.toString() ?? " "} G'),
                        backgroundColor: Colors.amber,
                        radius: 25),
                    CircleAvatar(
                        child: Text(' ${meal?.fat?.toString() ?? " "} G'),
                        backgroundColor: Colors.amber,
                        radius: 25)
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(right: 15),
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Protein'),
                      Container(
                          margin: const EdgeInsets.only(right: 40, left: 35),
                          child: const Text('Carb')),
                      const Text('Fats'),
                    ],
                  ),
                ),
              ],
            )),
            Consumer<UserController>(
              builder: (context, viewmodel, _) => Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      // print(meal?.id);

                      await viewmodel.updateUserMeal(meal?.id);
                    },
                    child: Text(
                      'Add',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Colors.amber.withOpacity(1)
                            // const Color.fromRGBO(246, 197, 190, 1)
                            )),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).backgroundColor,
                    ),
                    child: IconButton(
                      onPressed: () async {
                        if (!viewmodel.isFavorite(meal?.id)) {
                          await viewmodel.addUserFavorites(meal?.id);
                        } else {
                          await viewmodel.removeUserFavorites(meal?.id);
                        }
                      },
                      icon: Icon(
                        viewmodel.isFavorite(meal?.id)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        size: 30,
                      ),
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
