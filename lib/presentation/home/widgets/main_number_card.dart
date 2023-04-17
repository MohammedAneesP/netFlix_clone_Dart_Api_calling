import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/number_card.dart';

import '../../widgets/main_title.dart';

class NumberCard extends StatelessWidget {
  //final String imageUrl;
  const NumberCard({Key? key, required this.postersList}) : super(key: key);
  final List<String> postersList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitile(title: "Top 10 TV Shows"),
        kHeight,
        LimitedBox(
          maxHeight: 200,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return NumberTitleCard(
                  imageurl: postersList[index],
                  index: index,
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 13,
                );
              },
              itemCount: postersList.length),
        ),
      ],
    );
  }
}
