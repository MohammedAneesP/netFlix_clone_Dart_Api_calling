import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';

class NumberTitleCard extends StatelessWidget {
  NumberTitleCard({
    super.key,
    required this.index,
    required this.imageurl,
  });
  final int index;
  int a = 1;
  final String imageurl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            numberCardSize,
            Container(
              width: 150,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: boredRadiusHome,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(imageurl),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 10,
          bottom: 10,
          child: BorderedText(
            strokeWidth: 10.0,
            strokeColor: Colors.white,
            child: Text(
              "${index + 1}",
              style: numberCardIndex,
            ),
          ),
        )
      ],
    );
  }
}
