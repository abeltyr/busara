import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  final int win;
  final int needed;
  final String image;
  const Box(
      {this.win = 0,
      this.needed = 0,
      this.image = "assets/images/Art.png",
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.blueGrey,
            width: 2,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (needed > 0)
            SizedBox(
                height: 76,
                child: Text(
                  "$win/$needed",
                  style: const TextStyle(
                    fontSize: 40,
                    fontStyle: FontStyle.italic,
                    color: Colors.blueGrey,
                  ),
                )),
          if (needed == 0)
            SizedBox(
                height: 76,
                child: Text(
                  win == 0 ? "--" : "$win",
                  style: const TextStyle(
                    fontSize: 40,
                    fontStyle: FontStyle.italic,
                    color: Colors.blueGrey,
                  ),
                )),
          Container(
            decoration: const BoxDecoration(border: Border()),
            height: 80,
            width: double.infinity,
            child: Image.asset(
              image,
              width: 100,
            ),
          )
        ],
      ),
    );
  }
}
