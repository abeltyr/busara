import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Box extends StatelessWidget {
  final int win;
  final int needed;
  final String image;
  final Color colorData;
  const Box(
      {this.win = 0,
      this.needed = 0,
      this.image = "assets/images/Art.png",
      this.colorData = const Color(0xFF773478),
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 127.5,
      height: 127.5,
      padding: const EdgeInsets.only(top: 15, bottom: 7.5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: colorData,
            width: 5,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (needed > 0)
            SizedBox(
                height: 40,
                child: Text(
                  "$win/$needed",
                  style: TextStyle(
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    color: colorData,
                  ),
                )),
          if (needed == 0)
            SizedBox(
                height: 40,
                child: Text(
                  win == 0 ? "--" : "$win",
                  style: TextStyle(
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    color: colorData,
                  ),
                )),
          GestureDetector(
            onTap: () {
              showMaterialModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset("assets/images/Guide.png"),
                ),
              );
            },
            child: Container(
              decoration: const BoxDecoration(border: Border()),
              height: 50,
              width: double.infinity,
              child: Image.asset(
                image,
                width: 80,
              ),
            ),
          )
        ],
      ),
    );
  }
}
