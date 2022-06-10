import 'package:flutter/material.dart';

class SearchExercise extends StatelessWidget {
  static const routeName = '/searchexercise-screen';
  const SearchExercise({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final categoryType = ModalRoute.of(context)!.settings.arguments as int?;
    return Scaffold(
      appBar: AppBar(),
      body: null,
    );
  }
}
