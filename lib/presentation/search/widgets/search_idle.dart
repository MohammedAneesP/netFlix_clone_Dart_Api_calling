import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/search/search_bloc.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/widgets/search_title.dart';

// const imgUrl =
//     "https://www.themoviedb.org/t/p/w250_and_h141_face/oHrrgAPEKpz0S1ofQntiZNrmGrM.jpg";

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchTextTitle(
              title: "Top Searches",
            ),
            kheight,
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state.isError) {
                    return const Center(
                      child: Text("error while getting data"),
                    );
                  } else if (state.idleList.isEmpty) {
                    return const Center(
                      child: Text("List is empty"),
                    );
                  }
                  return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final movie = state.idleList[index];
                        return TopSearchTile(title: movie.title??"no title provided", imageUrl: movie.posterPath??"");
                      },
                      separatorBuilder: (context, index) {
                        return kheight20;
                      },
                      itemCount: state.idleList.length);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TopSearchTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  const TopSearchTile({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: screenWidth * 0.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image:  DecorationImage(
                image: NetworkImage(
                  imageUrl,
                ),
                fit: BoxFit.cover),
          ),
        ),
         Expanded(
          child: Text(
            title,
            style:const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        const CircleAvatar(
          backgroundColor: kwhite,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: kButtonBlackColor,
            radius: 24,
            child: Icon(
              CupertinoIcons.play_fill,
            ),
          ),
        )
      ],
    );
  }
}
