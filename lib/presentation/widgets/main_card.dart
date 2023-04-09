import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';

class MainCardWidgets extends StatelessWidget {
  const MainCardWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          child: Container(
            width: 120,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: kBorderRadius,
              image: const DecorationImage(
                image: NetworkImage(
                  "https://www.themoviedb.org/t/p/w220_and_h330_face/qVdrYN8qu7xUtsdEFeGiIVIaYd.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        kwidth,
      ],
    );
  }
}
