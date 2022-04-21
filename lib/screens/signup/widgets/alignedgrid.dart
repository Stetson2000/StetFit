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
          children: const [
            ActivityLevelButton('Sedentary', ActivityLevel.sedentary),
            ActivityLevelButton(
                'Lightly Active', ActivityLevel.lightlyactivity),
            ActivityLevelButton(
                'Moderately Active', ActivityLevel.moderateactivity),
            ActivityLevelButton('Highly Active', ActivityLevel.highactivity),
            ActivityLevelButton('Extra Active', ActivityLevel.extractive),
          ]),
    );
  }
}
