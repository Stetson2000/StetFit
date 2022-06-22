import 'package:flutter/material.dart';

class CircleSymbol extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;

  const CircleSymbol({Key? key, required this.child, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: (height == null) ? 50 : height,
        width: (width == null) ? 50 : width,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Colors.amber, blurRadius: 3, offset: Offset(2, 2))
            ],
            // shape: BoxShape.circle,

            borderRadius: BorderRadius.circular(50),
            border: Border.all(width: 4, color: Colors.amber)),
        child: child);
  }
}
