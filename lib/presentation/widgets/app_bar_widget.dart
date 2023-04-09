import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/core/constants.dart';

class AppBarWidgets extends StatelessWidget {
  const AppBarWidgets({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kwidth,
        Text(
          title,
          style:
              GoogleFonts.montserrat(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        const Icon(
          Icons.cast,
          color: Colors.white,
        ),
        kwidth,
        Container(
          color: Colors.blue,
          width: 25,
          height: 25,
        ),
        kwidth,
      ],
    );
  }
}
