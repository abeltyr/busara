import 'package:busara/src/dashboard/controller/wins.dart';
import 'package:busara/src/dashboard/view/box.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class StatusBoard extends StatelessWidget {
  const StatusBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userWinsProvider =
        Provider.of<UserWinsProvider>(context, listen: true);
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        width: constraints.maxWidth,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Box(
                  image: "assets/images/Art.png",
                  win: userWinsProvider.userWins.art,
                  needed: userWinsProvider.userRequired.art,
                ),
                Box(
                  image: "assets/images/Energy.png",
                  win: userWinsProvider.userWins.energy,
                  needed: userWinsProvider.userRequired.energy,
                  colorData: const Color(0xFF7E7A3F),
                ),
                Box(
                  image: "assets/images/Security.png",
                  win: userWinsProvider.userWins.security,
                  needed: userWinsProvider.userRequired.security,
                  colorData: const Color(0xFF681E1C),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Box(
                  image: "assets/images/Nature.png",
                  win: userWinsProvider.userWins.nature,
                  needed: userWinsProvider.userRequired.nature,
                  colorData: const Color(0xFF91BC55),
                ),
                Box(
                  image: "assets/images/Wisdom.png",
                  win: userWinsProvider.userWins.wisdom,
                  needed: userWinsProvider.userRequired.wisdom,
                  colorData: const Color(0xFFD05D3C),
                ),
                Box(
                  image: "assets/images/Economy.png",
                  win: userWinsProvider.userWins.economy,
                  needed: userWinsProvider.userRequired.economy,
                  colorData: const Color(0xFF295B39),
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
