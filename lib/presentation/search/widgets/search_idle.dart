import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/search/search_bloc.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/widgets/title.dart';

import '../../../core/colors/colors.dart';

final imageList = [
  'assets/horriimage1.jpg'
      'assets/horriimage2.jpg'
      'assets/horrimage3.jpg'
      'assets/horriimage4.jpg'
      'assets/horriimage5.jpg'
      'assets/horriimage6.jpg'
];

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTiltle(title: "Top Searches"),
        kHeight,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.isError) {
                return const Center(
                  child: Text('Error Occured'),
                );
              } else if (state.idleList.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final movie = state.idleList[index];
                    return TopSearchTile(
                        imageUrl: '$imageAppendUrl${movie.posterPath}',
                        title: movie.title ?? 'No Title Provided');
                  },
                  separatorBuilder: (context, index) {
                    return kHeight20;
                  },
                  itemCount: state.idleList.length);
            },
          ),
        )
      ],
    );
  }
}

class TopSearchTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  const TopSearchTile({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.40,
          height: 95,
          decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(imageUrl),
              ),
              borderRadius: BorderRadius.circular(5)),
        ),
        kWidhth,
        Expanded(
          child: Text(
            title,
            style: tileText,
          ),
        ),
        const CircleAvatar(
          backgroundColor: searchTrailCircle,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: searchTrailInsideCircle,
            radius: 23,
            child: Icon(
              CupertinoIcons.play_fill,
              color: trailingColor,
            ),
          ),
        )
      ],
    );
  }
}
