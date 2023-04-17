import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';

import '../../../core/colors/colors.dart';


class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({Key? key, required this.text, required this.icon})
      : super(key: key);
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: addIconColor,
          size: 30,
        ),
        Text(
          text,
          style: myListText,
        )
      ],
    );
  }
}
