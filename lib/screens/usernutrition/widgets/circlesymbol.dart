import 'package:flutter/material.dart';

class CircleSymbol extends StatelessWidget {
  final Widget? child;

  const CircleSymbol({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Colors.amber, blurRadius: 3, offset: Offset(2, 2))
            ],
            // shape: BoxShape.circle,

            borderRadius: BorderRadius.circular(30),
            border: Border.all(width: 4, color: Colors.amber)),
        child: child);
  }
}
