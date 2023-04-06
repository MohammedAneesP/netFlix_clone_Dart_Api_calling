import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';


class NumberCard extends StatelessWidget {
  final int index;
  const NumberCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
              height: 200,
            ),
            SizedBox(
              child: Container(
                width: 130,
                height: 200,
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
        ),
        Positioned(
          left: 10,
          bottom: -18,
          child: BorderedText(
            strokeWidth: 5.0,
            strokeColor: kwhite,
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                color: kButtonBlackColor,
                fontSize: 140,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
