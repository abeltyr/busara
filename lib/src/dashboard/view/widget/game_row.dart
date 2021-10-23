import 'package:busara/src/dashboard/view/widget/game_box.dart';
import 'package:flutter/cupertino.dart';

class GameRow extends StatelessWidget {
  final double size;
  final int position;
  const GameRow({required this.size, required this.position, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GameBox(
          size: size,
          number: position,
        ),
        GameBox(
          size: size,
          number: position + 1,
        ),
        GameBox(
          size: size,
          number: position + 2,
        ),
        GameBox(
          size: size,
          number: position + 3,
        ),
      ],
    );
  }
}
