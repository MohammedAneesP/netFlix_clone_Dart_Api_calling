import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/doamin/downloads/models/model_download.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

import '../../../application/fast_laugh/fast_laugh_bloc.dart';
import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';

class VideoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;

  //Creating Constructor
  //giving the constructor into the inherited widget class

  const VideoListItemInheritedWidget({
    super.key,
    required this.widget,
    required this.movieData,
  }) : super(child: widget);

  @override
  //notify to the widget rebuilding where the child or parent data will change
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    //the UI will rebuild our oldwidget is not matching to the corresponding moviedata
    return oldWidget.movieData != movieData;
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final posterPath =
        VideoListItemInheritedWidget.of(context)?.movieData.posterPath;
    final videoUrl = dummyVideoUrls[index % dummyVideoUrls.length];

    return Stack(
      children: [
        FastLaughVideoPlayer(videoUrl: videoUrl, onStateChanged: (bool) {}),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //left side
                muteButton,
                //rightside
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: posterPath == null
                            ? null
                            : NetworkImage('$imageAppendUrl$posterPath'),
                      ),
                    ),
                    BlocBuilder<FastLaughBloc, FastLaughState>(
                      builder: (context, state) {
                        final _index = index;

                        return VideoACtionWidget(
                          icon: laughIcon1,
                          title: "LOL",
                        );
                      },
                    ),
                    // kHeight,
                    const VideoACtionWidget(
                      icon: laughIcon2,
                      title: "My List",
                    ),
                    GestureDetector(
                      onTap: () {
                        final movieName =
                            VideoListItemInheritedWidget.of(context)
                                ?.movieData
                                .posterPath;
                        if (movieName != null) {
                          Share.share(movieName);
                        }
                      },
                      child: const VideoACtionWidget(
                        icon: laughIcon3,
                        title: "Share",
                      ),
                    ),
                    const VideoACtionWidget(
                      icon: laughIcon4,
                      title: "Play",
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoACtionWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoACtionWidget({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: laughIconColor,
            size: 30,
          ),
          Text(
            title,
            style: textStyleIcons,
          ),
          kHeight
        ],
      ),
    );
  }
}

class FastLaughVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final void Function(bool isPlaying) onStateChanged;
  const FastLaughVideoPlayer({
    super.key,
    required this.videoUrl,
    required this.onStateChanged,
  });

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _videoPlayerController.initialize().then((value) {
      setState(() {});
      _videoPlayerController.play();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: _videoPlayerController.value.isInitialized
            ? AspectRatio(
                aspectRatio: _videoPlayerController.value.aspectRatio,
                child: VideoPlayer(_videoPlayerController),
              )
            : const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ));
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
