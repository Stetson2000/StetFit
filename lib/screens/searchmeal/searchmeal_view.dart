import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';
import 'package:stetfit/models/meal.dart';
import 'package:stetfit/screens/addmeal/meal_view.dart';
import 'package:stetfit/screens/searchmeal/searchmeal_viewmodel.dart';
import 'package:stetfit/screens/searchmeal/widgets/mealitem.dart';

class SearchMeal extends StatelessWidget {
  static const routeName = "/searchmeal-screen";

  SearchMeal({Key? key}) : super(key: key);

  List<Meal?> meals = [];

  TextEditingController userQuery = TextEditingController();
  // FocusNode fieldFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Meal'),
      ),
      body: SingleChildScrollView(
        child: Consumer<SearchMealViewModel>(
          builder: (context, viewmodel, _) => Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                child: TypeAheadField<Meal?>(
                  debounceDuration: const Duration(milliseconds: 500),
                  hideSuggestionsOnKeyboardHide: false,
                  textFieldConfiguration: TextFieldConfiguration(
                    // focusNode: fieldFocus,
                    // autofocus: true,
                    controller: userQuery,
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                          onPressed: () async {
                            meals = await viewmodel
                                .searchByTitle(userQuery.text.toUpperCase());
                            userQuery.clear();
                          },
                          // fieldFocus.requestFocus();,
                          icon: const Icon(Icons.search)),
                      border: OutlineInputBorder(),
                      hintText: 'Search Meals',
                    ),
                  ),
                  suggestionsCallback: (userquery) {
                    return viewmodel.searchSuggestion(userquery);
                  },
                  itemBuilder: (context, Meal? suggestion) {
                    final meal = suggestion!;

                    return ListTile(
                      title: Text(meal.title.toString().toLowerCase()),
                    );
                  },
                  noItemsFoundBuilder: (context) => Container(
                    height: 100,
                    child: const Center(
                      child: Text(
                        'No Users Found.',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                  onSuggestionSelected: (Meal? suggestion) {
                    userQuery.text = suggestion?.title?.toLowerCase() ?? "";
                  },
                ),
              ),

              // Container(
              //   alignment: Alignment.centerRight,
              //   margin: const EdgeInsets.only(
              //       left: 20, right: 20, top: 10, bottom: 10),
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(15),
              //     border: Border.all(width: 2),
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     // crossAxisAlignment:
              //     children: [
              //       IconButton(
              //         icon: const Icon(
              //           Icons.search,
              //           size: 30,
              //         ),
              //         onPressed: () async {
              //           meals = await viewmodel
              //               .searchByTitle(userQuery.text.toUpperCase());
              //           for (var i = 0; i < meals.length; i++) {
              //             print(meals[i]?.title);
              //           }
              //         },
              //       ),
              //       Container(
              //         margin: const EdgeInsets.only(bottom: 15),
              //         width: 200,
              //         child: TextField(controller: userQuery),
              //       ),
              //       const IconButton(
              //           onPressed: null,
              //           icon: Icon(
              //             Icons.cancel,
              //             size: 30,
              //           ))
              //     ],
              //   ),
              // ),

              Container(
                height: 400,
                child: ListView.builder(
                  itemBuilder: ((context, index) => GestureDetector(
                        onTap: () => Navigator.of(context).pushNamed(
                            MealScreen.routeName,
                            arguments: meals[index]),
                        child: MealItem(
                          title: meals[index]?.title,
                          imageUrl: meals[index]?.imageUrl,
                        ),
                      )),
                  itemCount: meals.length,
                ),

                // Column(
                //     children: meals
                //         .map((meal) => Container(
                //             margin: const EdgeInsets.all(10),
                //             decoration: BoxDecoration(
                //               border: Border.all(color: Colors.black),
                //               borderRadius: BorderRadius.circular(15),
                //             ),
                //             child: ListTile(
                //                 onTap: () => Navigator.pushNamed(
                //                     context, MealScreen.routeName,
                //                     arguments: meal),
                //                 // print("tapped"),
                //                 leading: Text(meal?.id.toString() ?? ""),
                //                 title: Row(
                //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //                   crossAxisAlignment: CrossAxisAlignment.center,
                //                   children: [
                //                     Text(
                //                       meal?.title ?? "",
                //                     ),
                //                     Text(
                //                       meal?.kcal.toString() ?? " ",
                //                     ),
                //                     Text(
                //                       meal?.grade ?? " ",
                //                     ),
                //                   ],
                //                 ))))

                //         .toList()),
              )
            ],
          ),
        ),
      ),
    );
  }
}


// Container(
//                 alignment: Alignment.centerRight,
//                 margin: const EdgeInsets.only(
//                     left: 20, right: 20, top: 10, bottom: 10),
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   border: Border.all(width: 2),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   // crossAxisAlignment:
//                   children: [
//                     IconButton(
//                       icon: const Icon(
//                         Icons.search,
//                         size: 30,
//                       ),
//                       onPressed: () async {
//                         meals = await viewmodel
//                             .searchByTitle(userQuery.text.toUpperCase());
//                         for (var i = 0; i < meals.length; i++) {
//                           print(meals[i]?.title);
//                         }
//                       },
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(bottom: 15),
//                       width: 200,
//                       child: TextField(controller: userQuery),
//                     ),
//                     const IconButton(
//                         onPressed: null,
//                         icon: Icon(
//                           Icons.cancel,
//                           size: 30,
//                         ))
//                   ],
//                 ),
//               ),