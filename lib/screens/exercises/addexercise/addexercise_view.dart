import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:stetfit/controllers/user_controller.dart';
import 'package:stetfit/models/exercise.dart';

class AddExercise extends StatefulWidget {
  static const routeName = '/addexercise-screen';
  AddExercise({Key? key}) : super(key: key);

  @override
  State<AddExercise> createState() => _AddExerciseState();
}

class _AddExerciseState extends State<AddExercise> {
  int? duration = 15;

  Widget buildTitle(BuildContext ctx, String title) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          style: Theme.of(ctx).textTheme.headline6,
          softWrap: true,
          overflow: TextOverflow.clip,
          textAlign: TextAlign.center,
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
    final exercise = ModalRoute.of(context)!.settings.arguments as Exercise?;

    return Scaffold(
      appBar: AppBar(title: Text(exercise?.title ?? ''), centerTitle: true),
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
                  'assets/gifs/${exercise?.imageUrl?.toString()}',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            buildTitle(context, 'Description'),
            buildContainer(Text(exercise?.description ?? "")),
            Container(
                width: double.infinity / 3,
                child:
                    buildTitle(context, 'Enter Duration Performed in Minutes')),
            Container(
                // height: 120,
                // padding: const EdgeInsets.all(1),
                width: 175,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.amber),
                ),
                child: NumberPicker(
                  itemWidth: 60,
                  itemHeight: 35,
                  axis: Axis.horizontal,
                  minValue: 1,
                  maxValue: 60,
                  value: duration!,
                  onChanged: (value) => setState(() {
                    duration = value;
                  }),
                )),
            Consumer<UserController>(
              builder: (context, viewmodel, _) => ElevatedButton(
                onPressed: () async {
                  ExerciseOrder order =
                      ExerciseOrder(id: exercise?.id, duration: duration);
                  await viewmodel.addExercise(order);
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
                    backgroundColor:
                        MaterialStateProperty.all(Colors.amber.withOpacity(1)
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
