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
        title: Text(meal?.title ?? " "),
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
                child: Image.network(
                  'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/carton_of_eggs-84d8eef.jpg?quality=90&resize=556,505',
                  fit: BoxFit.cover,
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
              builder: (context, viewmodel, _) => ElevatedButton(
                onPressed: () async {
                  await viewmodel.updateUserMeal(meal?.id);
                },
                child: Text(
                  'Add Meal',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.amber.withOpacity(0.7)
                            // const Color.fromRGBO(246, 197, 190, 1)
                            )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
