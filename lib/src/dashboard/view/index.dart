import 'package:busara/models/board_component.dart';
import 'package:busara/src/dashboard/controller/index.dart';
import 'package:busara/src/dashboard/view/widget/game_box.dart';
import 'package:busara/src/dashboard/view/widget/game_row.dart';
import 'package:busara/src/dashboard/view/widget/resource.dart';
import 'package:busara/utils/color_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final double size =
        MediaQuery.of(context).size.width < MediaQuery.of(context).size.height
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.height;
    final gameBoardProvider =
        Provider.of<GameBoardProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: PlatformColorTheme.secondaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Stack(
                children: [
                  Container(
                    // margin: const EdgeInsets.all(25),
                    width: size - 50,
                    height: size - 50,
                    color: PlatformColorTheme.primaryColor,
                    child: Image.asset(
                      "assets/images/boarder.png",
                    ),
                  ),
                  Container(
                    // margin: const EdgeInsets.all(20),
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
              ),
              // if (gameBoardProvider.showResource)

              Draggable(
                data: GameBoardModel(
                  state: gameBoardProvider.resource,
                  position: -1,
                ),
                child: Resource(data: gameBoardProvider.resource),
                childWhenDragging: const SizedBox(
                  width: 0,
                  height: 0,
                ),
                feedback: Resource(data: gameBoardProvider.resource),
              ),
              const SizedBox(
                width: 50,
              ),
              GestureDetector(
                onTap: () {
                  Random random = Random();
                  int randomNumber = random.nextInt(4);
                  switch (randomNumber) {
                    case 1:
                      gameBoardProvider.setResource("fire");
                      return;
                    case 2:
                      gameBoardProvider.setResource("earth");
                      return;
                    case 3:
                      gameBoardProvider.setResource("wind");
                      return;
                    case 4:
                      gameBoardProvider.setResource("water");
                      return;
                    default:
                      gameBoardProvider.setResource("water");
                      return;
                  }
                },
                child: Container(
                  width: 50,
                  height: 50,
                  color: PlatformColorTheme.primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
