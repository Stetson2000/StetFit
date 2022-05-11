import 'package:flutter/material.dart';
// import 'package:stetfit/screens/addmeal/widgets/circlegradient.dart';
import 'package:stetfit/screens/userdashboard/widgets/cardgradient.dart';

class UserDashboard extends StatelessWidget {
  static const routeName = '/userdashboard-screen';

  const UserDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Column(children: [
      Container(
        height: height / 3,
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Theme.of(context).primaryColor.withOpacity(0.4),
          elevation: 6,
          child: Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                'Nutrition',
                textAlign: TextAlign.center,
              )),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 15),
            child: CardGradient(
              height: (height / 4) - 30,
              width: (width / 2) - 30,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 15),
            child: CardGradient(
              height: (height / 4) - 30,
              width: (width / 2) - 30,
            ),
          ),
        ],
      ),
    ]);
  }
}
