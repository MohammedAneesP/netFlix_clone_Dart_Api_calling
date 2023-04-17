import 'package:flutter/material.dart';
import '../../../core/constants.dart';

class MainHomeCard extends StatelessWidget {
  final String imageUrl;
  const MainHomeCard({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 250,
      // color: Colors.white,
      decoration: BoxDecoration(
  borderRadius: boredRadiusHome,
  image: DecorationImage(
    fit: BoxFit.cover,
    image: NetworkImage(imageUrl),
  ),
)
    );
  }
}
