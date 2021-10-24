import 'package:busara/src/dashboard/view/widget/game_row.dart';
import 'package:busara/utils/color_theme.dart';
import 'package:flutter/cupertino.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: The box division based on the image is done poorly it won't scale properly with the screen change so it need change

    final double size =
        MediaQuery.of(context).size.width < MediaQuery.of(context).size.height
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          width: size - 50,
          height: size - 50,
          color: PlatformColorTheme.primaryColor,
          child: Image.asset(
            "assets/images/boarder.png",
          ),
        ),
        Container(
          width: size - 50,
          height: size - 50,
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
