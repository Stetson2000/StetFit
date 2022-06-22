import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stetfit/helpers/appcolors.dart';

class CardGradient extends StatelessWidget {
  final double? height, width;
  final String? title;
  final MaterialColor? firstColor, secondColor;
  final String? imageUrl;
  const CardGradient(
      {Key? key,
      required this.height,
      required this.width,
      required this.firstColor,
      required this.secondColor,
      required this.imageUrl,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment
      height: (height! + 25),
      margin: const EdgeInsets.only(top: 10),
      // padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        // shape: BoxShape.circle,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: firstColor!, blurRadius: 6, offset: const Offset(2, 2))
        ],
        gradient: AppColors.getLinearGradientDouble(firstColor!, secondColor!),
      ),
      width: width,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(top: 10, left: 20),
              child: Text(
                'Your ${title ?? ""}',
                style: GoogleFonts.ubuntu(fontSize: 26),
                softWrap: true,
                overflow: TextOverflow.visible,
              )),
          Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                color: Colors.white,
              ),
              width: double.infinity,
              height: height! * 0.6,
              padding: const EdgeInsets.all(0.5),
              child: title == "Nutrition"
                  ? Image.asset(
                      'assets/images/$imageUrl',
                      fit: BoxFit.fitWidth,
                    )
                  : Container(
                      padding: const EdgeInsets.all(15),
                      child: Image.asset(
                        'assets/images/$imageUrl',
                        alignment: Alignment.centerRight,
                      ),
                    )),
        ],
      ),
    );
  }
}
