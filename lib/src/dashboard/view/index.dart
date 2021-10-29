import 'package:busara/src/dashboard/controller/wins.dart';
import 'package:busara/src/dashboard/view/widget/flipcard.dart';
import 'package:busara/src/dashboard/view/widget/game_board.dart';
import 'package:busara/src/dashboard/view/widget/kingdom.dart';
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
    final double size =
        MediaQuery.of(context).size.width < MediaQuery.of(context).size.height
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.height;
    final userWinsProvider =
        Provider.of<UserWinsProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: PlatformColorTheme.secondaryColor,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            GameBoard(size: size),
            Container(
              height: MediaQuery.of(context).size.height - 50,
              width: (MediaQuery.of(context).size.width - size),
              margin: const EdgeInsets.symmetric(
                vertical: 25,
                horizontal: 25,
              ),
              child: ListView(
                children: [
                  const StatusBoard(),
                  const Kingdom(),
                  const StarterBoard(),
                  Row(
                    mainAxisAlignment: userWinsProvider.winList.isNotEmpty
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.center,
                    children: <Widget>[
                      if (userWinsProvider.winList.isNotEmpty)
                        SizedBox(
                          width: (MediaQuery.of(context).size.width - size) *
                              2 /
                              5,
                          child: const WinList(),
                        ),
                      SizedBox(
                        width:
                            (MediaQuery.of(context).size.width - size) * 3 / 5,
                        child: const FlipCardWidget(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
