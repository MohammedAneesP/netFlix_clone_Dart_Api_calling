import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';


import 'main_home_card.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    Key? key,
    required this.title,
    required this.posterList,
  }) : super(key: key);
  final String title;
  final List<String> posterList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        MainTitile(title: title),
        kHeight,
        LimitedBox(
          maxHeight: 200,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return MainHomeCard(
                  imageUrl: posterList[index],
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 13,
                );
              },
              itemCount: posterList.length),
        ),
      ],
    );
  }
}
