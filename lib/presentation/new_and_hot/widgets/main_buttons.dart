import 'package:flutter/material.dart';

class NewHotButtons extends StatelessWidget {
  const NewHotButtons(
      {Key? key,
      required this.color,
      required this.text,
      required this.icon,
      required this.size,
      required this.textSize})
      : super(key: key);
  final IconData icon;
  final Color color;
  final String text;
  final double size;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          icon,
          color: color,
          size: size,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: textSize,
          ),
        )
      ],
    );
  }
}
