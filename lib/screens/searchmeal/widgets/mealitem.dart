import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  final String? title;
  final String? imageUrl;

  const MealItem({Key? key, this.title, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => selectMeal(context),
      child: Card(
        elevation: 4,
        // margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black54.withOpacity(0.5),

                        // Theme.of(context).backgroundColor.withOpacity(0.4),
                        width: 4,
                      )),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    child: Image.asset(
                      'assets/images/$imageUrl',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 175,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(5),
                    color: Colors.black54,
                    child: Text(
                      title ?? " ",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.all(10),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: const [],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
