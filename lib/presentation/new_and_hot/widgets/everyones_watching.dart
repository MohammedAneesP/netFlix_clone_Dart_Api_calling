import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/main_buttons.dart';

import '../../../core/colors/colors.dart';
import 'video_widget.dart';


class EveryOneWatching extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String descrption;

  // final String descriptionText;

  const EveryOneWatching({
    super.key,
    required this.posterPath,
    required this.movieName,
    required this.descrption,
    //required this.descriptionText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      kHeight,
      Padding(
        padding: textGap.padding,
        child: Text(
          movieName,
          style: contentTextGap,
        ),
      ),
      Padding(
        padding: textGap.padding,
        child: Text(
          descrption,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          style: descrptionStyle,
        ),
      ),
      kHeight,

      //videoGap,
      VideoWidget(
        url: posterPath,
      ),
      kHeight,
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          NewHotButtons(
            color: newhotColor,
            icon: Icons.share,
            size: 28,
            text: "Share",
            textSize: 16,
          ),
          kWidhth,
          NewHotButtons(
            color: newhotColor,
            icon: Icons.add,
            size: 32,
            text: "My List",
            textSize: 16,
          ),
          kWidhth,
          NewHotButtons(
            color: newhotColor,
            icon: Icons.play_arrow,
            size: 34,
            text: "Play",
            textSize: 16,
          ),
          kWidhth
          //CustomButtonWidget(text: text, icon: icon)
        ],
      )
    ]);
  }
}
