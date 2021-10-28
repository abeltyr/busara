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
    return Container(
      width: 500,
      height: 350,
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Box(
                image: "assets/images/Art.png",
                win: userWinsProvider.userWins.art,
                needed: userWinsProvider.userRequired.art,
              ),
              const SizedBox(
                width: 10,
              ),
              Box(
                image: "assets/images/Energy.png",
                win: userWinsProvider.userWins.energy,
                needed: userWinsProvider.userRequired.energy,
              ),
              const SizedBox(
                width: 10,
              ),
              Box(
                image: "assets/images/Security.png",
                win: userWinsProvider.userWins.security,
                needed: userWinsProvider.userRequired.security,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Box(
                image: "assets/images/Wisdom.png",
                win: userWinsProvider.userWins.wisdom,
                needed: userWinsProvider.userRequired.wisdom,
              ),
              const SizedBox(
                width: 10,
              ),
              Box(
                image: "assets/images/Nature.png",
                win: userWinsProvider.userWins.nature,
                needed: userWinsProvider.userRequired.nature,
              ),
              const SizedBox(
                width: 10,
              ),
              Box(
                image: "assets/images/Economy.png",
                win: userWinsProvider.userWins.economy,
                needed: userWinsProvider.userRequired.economy,
              ),
            ],
          )
        ],
      ),
    );
  }
}
