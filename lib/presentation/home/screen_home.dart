import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/background_card.dart';
import '../widgets/main_title_card.dart';
import 'widgets/number_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class Screenhome extends StatelessWidget {
  const Screenhome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollNotifier,
      builder: (context, value, child) {
        return NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            // print(direction);
            if (direction == ScrollDirection.reverse) {
              scrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollNotifier.value = true;
            }
            return true;
          },
          child: Stack(
            children: [
              ListView(
                children: const [
                  BackgroundCard(),
                  MainTitleCard(title: "Released in the past year"),
                  kheight,
                  MainTitleCard(title: "Trending Now"),
                  kheight,
                  NumberTitleCard(),
                  kheight,
                  MainTitleCard(title: "Tense Dramas"),
                  kheight,
                  MainTitleCard(title: "South Indian Cinemas"),
                ],
              ),
              scrollNotifier.value == true
                  ? AnimatedContainer(
                      duration: const Duration(milliseconds: 1000),
                      height: 80,
                      color: Colors.black.withOpacity(0.3),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.network(
                                "https://www.freepnglogos.com/uploads/netflix-logo-app-png-16.png",
                                width: 50,
                                height: 40,
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.cast,
                                color: Colors.white,
                                size: 30,
                              ),
                              kwidth,
                              Container(
                                color: Colors.blue,
                                width: 30,
                                height: 30,
                              ),
                              kwidth,
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text(
                                "TV shows",
                                style: kTextStyles,
                              ),
                              Text(
                                "Movies",
                                style: kTextStyles,
                              ),
                              Text(
                                "Categories",
                                style: kTextStyles,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  : kheight,
            ],
          ),
        );
      },
    ));
  }

  // TextButton _playButton() {
  //   return TextButton.icon(
  //     onPressed: () {},
  //     style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kwhite)),
  //     icon: const Icon(
  //       Icons.play_arrow_rounded,
  //       size: 25,
  //       color: kButtonBlackColor,
  //     ),
  //     label: const Padding(
  //       padding: EdgeInsets.symmetric(horizontal: 10),
  //       child: Text(
  //         "Play",
  //         style: TextStyle(fontSize: 20, color: kButtonBlackColor),
  //       ),
  //     ),
  //   );
  // }
}
