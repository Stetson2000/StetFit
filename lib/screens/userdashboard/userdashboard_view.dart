import 'package:flutter/material.dart';
// import 'package:stetfit/screens/addmeal/widgets/circlegradient.dart';
import 'package:stetfit/screens/userdashboard/widgets/cardgradient.dart';
import 'package:stetfit/screens/userfavorites/userfavorites_view.dart';

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
        child: CardGradient(
          imageUrl: "nutrition-splash.png",
          title: "Nutrition",
          width: width,
          height: height / 3,
          firstColor: Colors.green,
          secondColor: Colors.amber,
        ),
      ),
      const SizedBox(height: 15),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 15),
            child: GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(UserFavorites.routeName),
              child: CardGradient(
                imageUrl: "yellow-heart.png",
                title: "Favorites",
                height: (height / 4) - 30,
                width: (width / 2) - 30,
                firstColor: Colors.red,
                secondColor: Colors.amber,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 15),
            child: CardGradient(
              imageUrl: "exercise.png",
              title: "Exercise ",
              height: (height / 4) - 30,
              width: (width / 2) - 30,
              firstColor: Colors.blue,
              secondColor: Colors.deepPurple,
            ),
          ),
        ],
      ),
    ]);
  }
}
