import 'package:busara/src/dashboard/view/widget/game_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameBoard extends StatelessWidget {
  final double size;
  const GameBoard({required this.size, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: The box division based on the image is done poorly it won't scale properly with the screen change so it need change

    return Stack(
      children: [
        Container(
          width: size - 50,
          height: size - 50,
          margin: const EdgeInsets.symmetric(vertical: 25),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(45),
            child: Image.asset(
              "assets/images/boarder.png",
            ),
          ),
        ),
        Container(
          width: size - 50,
          height: size - 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(45),
          ),
          margin: const EdgeInsets.symmetric(vertical: 25),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              GameRow(
                size: size,
                position: 0,
              ),
              GameRow(
                size: size,
                position: 4,
              ),
              GameRow(
                size: size,
                position: 8,
              ),
              GameRow(
                size: size,
                position: 12,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
