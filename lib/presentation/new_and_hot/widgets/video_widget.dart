import 'package:flutter/material.dart';

import '../../../core/constants.dart';


class VideoWidget extends StatelessWidget {
  final String url;
  const VideoWidget({
    required this.url,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            
            height: 300,
            width: double.infinity,
            child: Image.network(
              url,
              fit: BoxFit.cover,
              loadingBuilder:
                  (BuildContext _, Widget child, ImageChunkEvent? progress) {
                if (progress == null) {
                  return child;
                } else {
                  return const Center(
                      child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ));
                }
              },
              errorBuilder: (BuildContext _, Object a, StackTrace? trace) {
                return const Center(
                  child: Icon(Icons.wifi),
                );
              },
            ),
          ),
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: muteButtonNewHot,
        )
      ],
    );
  }
}
