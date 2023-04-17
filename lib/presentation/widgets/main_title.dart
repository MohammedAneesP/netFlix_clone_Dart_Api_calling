import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


import '../../core/constants.dart';

class MainTitile extends StatelessWidget {
  const MainTitile({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: searchText1,
    );
  }
}
