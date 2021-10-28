import 'package:busara/src/dashboard/controller/index.dart';
import 'package:busara/src/dashboard/controller/wins.dart';
import 'package:busara/src/dashboard/view/widget/flipcard.dart';
import 'package:busara/src/dashboard/view/widget/game_board.dart';
import 'package:busara/src/dashboard/view/widget/starter_board.dart';
import 'package:busara/src/dashboard/view/widget/status_board.dart';
import 'package:busara/src/dashboard/view/widget/win_list.dart';
import 'package:busara/utils/color_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  static const routeName = '/game';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PlatformColorTheme.secondaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              const GameBoard(),
              SizedBox(
                height: MediaQuery.of(context).size.height - 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const StarterBoard(),
                    // if (!gameBoardProvider.starter)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const <Widget>[
                        WinList(),
                        FlipCardWidget(),
                      ],
                    ),
                    const StatusBoard()
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
