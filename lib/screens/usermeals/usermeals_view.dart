// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:stetfit/controllers/user_controller.dart';
// import 'package:stetfit/models/meal.dart';
// import 'package:stetfit/models/user.dart';
// import 'package:stetfit/screens/usermeals/usermeals_viewmodel.dart';

// class UserMeals extends StatelessWidget {
//   static const routeName = "/usermeals-screen";

//   UserMeals({Key? key}) : super(key: key);
//   List<Meal?> meals = [];

//   @override
//   Widget build(BuildContext context) {
//     UserController userController = context.watch<UserController>();
//     final User user = userController.user;

//     UserMealsViewModel userMealsViewModel = context.watch<UserMealsViewModel>();

//     userMealsViewModel.setMealsID(user.meals!);

//     // List <Meal?> meals= await userMealsViewModel.getUserMeal();

//     return Column(
//       children: [
//         IconButton(
//             onPressed: () async =>
//                 meals = await userMealsViewModel.getUserMeal(),
//             icon: const Icon(Icons.arrow_downward)),
//         Column(
//             children: (meals.isEmpty)
//                 ? [
//                     const Center(
//                       child: Text('You do not have any  meals added'),
//                     )
//                   ]
//                 : meals
//                     .map((meal) => Container(
//                         margin: const EdgeInsets.all(10),
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.black),
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         child: ListTile(
//                             onTap: null,
//                             // print("tapped"),
//                             // leading: Text(),
//                             title: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   meal?.title ?? "test",
//                                 ),
//                                 Text(
//                                   meal?.kcal.toString() ?? " ",
//                                 ),
//                                 Text(
//                                   meal?.grade ?? " ",
//                                 ),
//                               ],
//                             ))))
//                     .toList()),
//       ],
//     );
//   }
// }
