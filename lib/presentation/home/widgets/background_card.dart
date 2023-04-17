import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import 'button_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: homeMainImage,
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
                const CustomButtonWidget(icon: Icons.add, text: "My List"),
                _PlayButton(),
                // CustomButtonWidget(text: , icon: icon)
                const CustomButtonWidget(text: "Info", icon: Icons.info)
              ],
            ),
          ),
        )
      ],
    );
  }

  TextButton _PlayButton() {
    return TextButton.icon(
      onPressed: () {},
      style: buttonPlayStyle,
      icon: const Icon(
        Icons.play_arrow,
        size: 30,
        color: playTextColor,
      ),
      label: Text(
        'Play',
        style: playText,
      ),
    );
  }
}
