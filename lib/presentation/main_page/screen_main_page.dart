import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/downloads/screen_downloads.dart';
import 'package:netflix_clone/presentation/fast_laugh/screen_fast_laugh.dart';
import 'package:netflix_clone/presentation/home/screen_home.dart';
import 'package:netflix_clone/presentation/main_page/widgets/bottom_nav.dart';
import 'package:netflix_clone/presentation/new_and_hot.dart/new_and_hot.dart';
import 'package:netflix_clone/presentation/search/screen_search.dart';

class ScreenMianPage extends StatelessWidget {
  const ScreenMianPage({super.key});

  final pages = const [
    Screenhome(),
    ScreenNewAndHot(),
    ScreenFastLaugh(),
    ScreenSearch(),
    ScreenDownloads(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, value, child) {
            return pages[value];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
