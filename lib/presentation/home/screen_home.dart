import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/main_title_card.dart';
import '../../application/home/home_bloc.dart';
import '../../core/colors/colors.dart';
import 'widgets/background_card.dart';
import 'widgets/main_number_card.dart';


ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHomePage extends StatelessWidget {
  const ScreenHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: scrollNotifier,
          builder: (BuildContext context, bool value, Widget? _) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection direction = notification.direction;
                if (direction == ScrollDirection.reverse) {
                  scrollNotifier.value = false;
                } else if (direction == ScrollDirection.forward) {
                  scrollNotifier.value = true;
                }
                return true;
              },
              child: Stack(
                children: [
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        );
                      } else if (state.hasError) {
                        return Center(child: Text('Error While Getting data'));
                      }

                      final _releasePastYear = state.pastYearMoveList.map((m) {
                        return '$imageAppendUrl${m.posterPath}';
                      }).toList();
                      //trending
                      final _trending = state.trendingMovieList.map((m) {
                        return '$imageAppendUrl${m.posterPath}';
                      }).toList();
                      _trending.shuffle();
                      //tense drama
                      final _tenseDrama = state.tenseDramasMoveList.map((m) {
                        return '$imageAppendUrl${m.posterPath}';
                      }).toList();
                      _tenseDrama.shuffle();
                      //southindian filims
                      final _southFilims = state.sounthIndianMoveList.map((m) {
                        return '$imageAppendUrl${m.posterPath}';
                      }).toList();
                      _southFilims.shuffle();
                      //_southFilims.shuffle();

                      //top 10 tv shows
                      final _top10TvShows = state.trendingTvList.map((m) {
                        return '$imageAppendUrl${m.posterPath}';
                      }).toList();
                      _top10TvShows.shuffle();

                      return ListView(
                        children: [
                          //kHeight,
                          const BackgroundCard(),

                          MainTitleCard(
                            title: "Releases in this Year",
                            posterList: _releasePastYear.sublist(0, 10),
                          ),
                          MainTitleCard(
                              title: "Trending Now",
                              posterList: _trending.sublist(0, 10)),
                          NumberCard(postersList: _top10TvShows.sublist(0, 10)),
                          MainTitleCard(
                              title: "South Indian cinema",
                              posterList: _southFilims),
                          MainTitleCard(
                            title: "Tense Dramas",
                            posterList: _tenseDrama.sublist(0, 10),
                          )
                        ],
                      );
                    },
                  ),
                  scrollNotifier.value == true
                      ? AnimatedContainer(
                          duration: Duration(milliseconds: 1000),
                          width: double.infinity,
                          height: 90,
                          color: navBar,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'lib/assets/netflix-logo-png-2574.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.cast,
                                    color: castIconColor,
                                    size: 30,
                                  ),
                                  kWidhth,
                                  Container(
                                    width: 30,
                                    height: 30,
                                    color: Colors.blue,
                                  ),
                                  kWidhth
                                ],
                              ),
                              kHeight,
                              Row(
                                //crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'TV Shows',
                                    style: someHeaders,
                                  ),
                                  Text(
                                    'Movies',
                                    style: someHeaders,
                                  ),
                                  Text(
                                    'Categories',
                                    style: someHeaders,
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      : kHeight
                ],
              ),
            );
          },
        ),
      ),
    ));
  }

  // ignore: non_constant_identifier_names

}
