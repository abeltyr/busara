import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Resource extends StatelessWidget {
  final String data;
  const Resource({
    Key? key,
    this.data = "earth",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color colorData = const Color(0xFF363634);
    String imageData = "assets/images/Earth_Icon.png";
    if (data == "wind") {
      colorData = const Color(0xFFF5BB35);
      imageData = "assets/images/Wind_Icon.png";
    }
    if (data == "fire") {
      colorData = const Color(0xFFC54B4A);
      imageData = "assets/images/Fire_Icon.png";
    }
    if (data == "water") {
      colorData = const Color(0xFF33488A);
      imageData = "assets/images/Water_Icon.png";
    }

    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(250),
        color: colorData,
      ),
      child: Image.asset(
        imageData,
        fit: BoxFit.cover,
        width: 100,
        height: 100,
      ),
    );
  }
}
