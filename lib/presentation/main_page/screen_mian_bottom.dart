import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presentation/downloads/screen_download.dart';
import 'package:netflix_clone/presentation/home/screen_home.dart';
import 'package:netflix_clone/presentation/new_and_hot/screen_new_hot.dart';
import 'package:netflix_clone/presentation/search/screen_search.dart';

import '../fast_laugh/screen_fast_laugh.dart';
import 'widgets/bottom_nav.dart';



class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});
  final _pages = [
    const ScreenHomePage(),
    const ScreenNewHot(),
    const FastLaughScreen(),
    ScreenSearch(),
    ScreenDownload()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int index, _) {
          return _pages[index];
        },
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}
