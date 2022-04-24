import 'package:flutter/material.dart';
import 'package:stetfit/screens/addmeal/widgets/mealtypebutton.dart';

class AddMeal extends StatefulWidget {
  const AddMeal({Key? key}) : super(key: key);

  @override
  State<AddMeal> createState() => _AddMealState();
}

class _AddMealState extends State<AddMeal> {
  int? selectedid = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
              backgroundColor: Colors.white.withOpacity(0.6),
              shape: Border.all(color: Colors.black),
              context: context,
              builder: (context) => StatefulBuilder(
                    builder: (context, setter) => Container(
                      margin: const EdgeInsets.only(top: 30),
                      padding: const EdgeInsets.all(20),
                      child: GridView(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setter(() {
                                  selectedid = 1;
                                });
                              },
                              child: MealTypeButton(
                                title: "Breakfast",
                                buttonId: 1,
                                selectedId: selectedid,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => setter(() {
                                selectedid = 2;
                              }),
                              child: MealTypeButton(
                                title: "Lunch",
                                buttonId: 2,
                                selectedId: selectedid,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => setter(() {
                                selectedid = 3;
                              }),
                              child: MealTypeButton(
                                title: "Dinner",
                                buttonId: 3,
                                selectedId: selectedid,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => setter(() {
                                selectedid = 4;
                              }),
                              child: MealTypeButton(
                                title: "Snack",
                                buttonId: 4,
                                selectedId: selectedid,
                              ),
                            )
                          ],
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          )),
                    ),
                  ));
        },
        child: const CircleAvatar(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            backgroundColor: Colors.amber,
            radius: 100),
      ),
    );
  }
}
