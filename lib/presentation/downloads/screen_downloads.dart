import 'dart:developer';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/downloads/downloads_bloc.dart';
import 'package:netflix_clone/presentation/widgets/app_bar_widget.dart';
import '../../core/colors.dart';
import '../../core/constants.dart';

class ScreenDownloads extends StatelessWidget {
  const ScreenDownloads({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final _widgetLists = [
      const _SmartDownloads(),
      Section2(),
      const Section3(),
    ];

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidgets(
          title: "Downloads",
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return _widgetLists[index];
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 25,
            );
          },
          itemCount: _widgetLists.length),
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({super.key});

// final List imageList = [
//       "https://www.themoviedb.org/t/p/w220_and_h330_face/qVdrYN8qu7xUtsdEFeGiIVIaYd.jpg",
//       "https://www.themoviedb.org/t/p/w220_and_h330_face/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg",
//       "https://www.themoviedb.org/t/p/w220_and_h330_face/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg",
//     ];

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImages());
    });
    // BlocProvider.of<DownloadsBloc>(context)
    //     .add(const DownloadsEvent.getDownloadsImages());
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Text(
          "Introducing Downloads for you",
          style: TextStyle(
            color: kwhite,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const Text(
          "We will download a personalized selaction of\nmovies and shows for you,So there's\n'always something to watch on your\n device",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        kheight,
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            return SizedBox(
              width: size.width,
              height: size.width,
              child: state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.5),
                            radius: size.width * 0.38,
                          ),
                        ),
                        DownloadImageWidget(
                          imageList:
                              '$imageAppendUrl${state.downloads![0].posterPath}',
                          margin: const EdgeInsets.only(
                            left: 200,
                            top: 65,
                          ),
                          angle: 18,
                          size: Size(size.width * 0.35, size.width * 0.5),
                        ),
                        DownloadImageWidget(
                          imageList:
                              '$imageAppendUrl${state.downloads![1].posterPath}',
                          margin: const EdgeInsets.only(
                            right: 200,
                            top: 65,
                          ),
                          angle: -20,
                          size: Size(size.width * 0.35, size.width * 0.5),
                        ),
                        DownloadImageWidget(
                          imageList:
                              '$imageAppendUrl${state.downloads![2].posterPath}',
                          radius: 8,
                          size: Size(size.width * 0.38, size.width * 0.58),
                          margin: const EdgeInsets.only(left: 0, top: 38),
                        ),
                      ],
                    ),
            );
          },
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: kButtonColorBlue,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Setup",
                style: TextStyle(
                    color: kwhite, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        kheight,
        MaterialButton(
          onPressed: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: kwhite,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "See what you can Download",
              style: TextStyle(
                  color: kButtonBlackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kheight,
        Row(
          children: const [
            kwidth,
            Icon(
              Icons.settings,
              color: kwhite,
            ),
            kwidth,
            Text("Start Downloads"),
          ],
        ),
      ],
    );
  }
}

class DownloadImageWidget extends StatelessWidget {
  const DownloadImageWidget({
    Key? key,
    this.angle = 0,
    required this.imageList,
    required this.margin,
    required this.size,
    this.radius = 10,
  }) : super(key: key);

  final double angle;
  final String imageList;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: Container(
          //margin: margin,
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            image: DecorationImage(
              image: NetworkImage(
                imageList,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
