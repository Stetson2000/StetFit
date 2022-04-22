import 'package:flutter/material.dart';
import 'package:stetfit/models/user.dart';

class ActivityLevelButton extends StatelessWidget {
  final String? title;

  final int? buttonId;
  final int? selectedId;

  // final ActivityLevel? activityLevel;

  const ActivityLevelButton({this.title, this.buttonId, this.selectedId});
  // ActivityLevelButton(this.title,this.activityLevel);

  // void selectCatg(BuildContext ctx) {
  //   Navigator.of(ctx).pushNamed('/categorymeal', arguments: {
  //     'title': title,
  //     'id': id,
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      // onTap: () => print(activityLevel),
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
