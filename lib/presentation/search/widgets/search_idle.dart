import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/widgets/search_title.dart';

const imgUrl =
    "https://www.themoviedb.org/t/p/w250_and_h141_face/oHrrgAPEKpz0S1ofQntiZNrmGrM.jpg";

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchTextTitle(title: "Top Searches",),
            kheight,
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return const TopSearchTile();
                  },
                  separatorBuilder: (context, index) {
                    return kheight20;
                  },
                  itemCount: 10),
            )
          ],
        ),
      ),
    );
  }
}



class TopSearchTile extends StatelessWidget {
  const TopSearchTile({super.key});

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
            image:const DecorationImage(
                image: NetworkImage(
                  imgUrl,
                ),
                fit: BoxFit.cover),
          ),
        ),
      const  Expanded(
          child: Text(
            "Movie Name",style: 
            TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
          ),
        ),
        const CircleAvatar(
          backgroundColor: kwhite,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: kButtonBlackColor,
            radius: 24 ,
            child: Icon(CupertinoIcons.play_fill),
          ),
        )
      ],
    );
  }
}
