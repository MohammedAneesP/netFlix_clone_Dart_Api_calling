import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'custom_button_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(kMainImage), fit: BoxFit.cover)),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButtonWidget(icon: Icons.add, title: "My List"),
                _playButton(),
                const CustomButtonWidget(icon: Icons.info, title: "Info")
              ],
            ),
          ),
        ),
      ],
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
      onPressed: () {},
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kwhite)),
      icon: const Icon(
        Icons.play_arrow_rounded,
        size: 25,
        color: kButtonBlackColor,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          "Play",
          style: TextStyle(fontSize: 20, color: kButtonBlackColor),
        ),
      ),
    );
  }
}
