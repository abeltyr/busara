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
    Color colorData = Colors.black;
    if (data == "wind") colorData = Colors.yellow;
    if (data == "fire") colorData = Colors.red;
    if (data == "water") colorData = Colors.blue;

    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(250),
        color: colorData,
      ),
    );
  }
}
