import 'package:flutter/material.dart';
import 'package:stetfit/models/user.dart';
import 'package:stetfit/screens/signup/widgets/activitylevelButton.dart';

class AlignedGrid extends StatelessWidget {
  // final String title;
  // final ActivityLevel activityLevel;

  // AlignedGrid(this.title,this.activityLevel);

  final double runSpacing = 4;
  final double spacing = 4;
  final int listSize = 15;
  final columns = 4;

  @override
  Widget build(BuildContext context) {
    final w = (MediaQuery.of(context).size.width - runSpacing * (columns - 1)) /
        columns;
    return SingleChildScrollView(
      child: Wrap(
          runSpacing: runSpacing,
          spacing: spacing,
          alignment: WrapAlignment.center,
          // children: const [
          //   ActivityLevelButton(title: 'Sedentary', ),
          //   ActivityLevelButton(
          //       'Lightly Active', ),
          //   ActivityLevelButton(
          //       'Moderately Active', ),
          //   ActivityLevelButton('Highly Active', ),
          //   ActivityLevelButton('Extra Active', ),
          // ]
          ),
    );
  }
}
