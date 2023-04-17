import 'package:flutter/material.dart';

import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          kWidhth,
          Text(
            title,
            style: styleText,
          ),
          const Spacer(),
          const Icon(
            Icons.cast,
            color: castIconColor,
            size: 30,
          ),
          kWidhth,
          Container(
            width: 30,
            height: 30,
            color: Colors.blue,
          ),
          kWidhth
        ],
      ),
    );
  }
}
