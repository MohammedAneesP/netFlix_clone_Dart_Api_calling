import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final double iconSize;
  final double textSize;
  const CustomButtonWidget(
      {Key? key,
      required this.icon,
      required this.title,
      this.textSize = 18,
      this.iconSize = 30})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: iconSize,
          color: kwhite,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: textSize,
            color: kwhite,
          ),
        )
      ],
    );
  }
}
