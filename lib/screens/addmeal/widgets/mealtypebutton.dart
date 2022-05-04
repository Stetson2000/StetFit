import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stetfit/controllers/user_controller.dart';
import 'package:stetfit/screens/searchmeal/searchmeal_view.dart';

class MealTypeButton extends StatelessWidget {
  final String? title;
  final int? buttonId;
  final int? selectedId;
  // final Function? selected;

  const MealTypeButton({Key? key, this.title, this.buttonId, this.selectedId})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    UserController userController = context.watch<UserController>();
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      onTap: () {
          userController.notifyListeners();
        Navigator.pushNamed(context, SearchMeal.routeName);
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title!,
          style: Theme.of(context).textTheme.headline6,
          // textAlign: TextAlign.center,
        ),
        decoration: BoxDecoration(
            gradient: selectedId == buttonId
                ? LinearGradient(
                    colors: [
                      Theme.of(context).primaryColor.withOpacity(0.7),
                      Theme.of(context).primaryColor,
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomRight,
                  )
                : const LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.white,
                      // Theme.of(context).primaryColor.withOpacity(0.7),
                      // Theme.of(context).primaryColor,
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomRight,
                  ),
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
