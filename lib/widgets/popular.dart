import 'package:flutter/material.dart';

class PopularMovie extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String information;
  final GlobalKey backgroundImageKey = GlobalKey();

  PopularMovie(
      {Key? key,
      required this.imageUrl,
      required this.name,
      required this.information})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
