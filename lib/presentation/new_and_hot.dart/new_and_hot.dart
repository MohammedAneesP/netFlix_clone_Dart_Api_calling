import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/presentation/new_and_hot.dart/widgets/coming_soon_widget.dart';
import 'package:netflix_clone/presentation/new_and_hot.dart/widgets/every_one_watching_widgets.dart';
import '../../core/constants.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
            title: const Text(
              "Hot & New",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            actions: [
              const Icon(
                Icons.cast,
                color: kwhite,
                size: 30,
              ),
              kwidth,
              Container(
                color: Colors.blue,
                width: 25,
                height: 25,
              ),
              kwidth,
            ],
            bottom: TabBar(
              isScrollable: true,
              unselectedLabelColor: kwhite,
              labelColor: kButtonBlackColor,
              labelPadding: const EdgeInsets.all(10),
              labelStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              indicator: BoxDecoration(
                color: kwhite,
                borderRadius: kBorderRadius30,
              ),
              tabs: const [
                Text("🍿 Coming Soon"),
                Text("👀 Everyone's Watching"),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            _buildComingSoon(),
            _buildEveryOnesWatching(),
          ],
        ),
      ),
    );
  }

  Widget _buildComingSoon() {
    return ListView.builder(
      itemBuilder: (context, index) => const ComingSoonWidget(),
      itemCount: 10,
    );
  }

  Widget _buildEveryOnesWatching() {
    return ListView.builder(
      itemBuilder: (BuildContext context, index) =>
          const EveryonesWatchingWidget(),
      itemCount: 10,
    );
  }
}
