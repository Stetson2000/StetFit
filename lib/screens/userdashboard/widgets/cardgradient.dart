import 'package:flutter/material.dart';
import 'package:stetfit/helpers/appcolors.dart';

class CardGradient extends StatelessWidget {
  final double? height, width;
  const CardGradient({Key? key, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment
      height: height ?? 20 / 4,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        // shape: BoxShape.circle,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
              color: Colors.red, blurRadius: 12, offset: const Offset(2, 2))
        ],
        gradient: AppColors.getLinearGradient(Colors.red),
      ),
      width: width ?? 20 / 2,

      // color: Theme.of(context).primaryColor,

      child: Stack(
        children: [
          Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                'Exercises',
                // textAlign: TextAlign.center,
              )),
          Container(
            // alignment: Alignment.bottomRight,
            color: Colors.white,
            height: 20,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
