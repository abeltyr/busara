import 'package:busara/src/dashboard/controller/index.dart';
import 'package:busara/src/dashboard/controller/wins.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WinList extends StatelessWidget {
  const WinList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userWinsProvider =
        Provider.of<UserWinsProvider>(context, listen: true);
    final gameBoardProvider =
        Provider.of<GameBoardProvider>(context, listen: false);
    if (userWinsProvider.winList.isNotEmpty) {
      return Container(
        width: 120,
        margin: const EdgeInsets.only(
          right: 15,
        ),
        height: 360,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.blueGrey, width: 3),
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 315,
              child: ListView.builder(
                itemCount: userWinsProvider.winList.length,
                itemBuilder: (ctx, index) {
                  String image = "assets/images/Art.png";
                  if (userWinsProvider.winList[index] == "energy") {
                    image = "assets/images/Energy.png";
                  }
                  if (userWinsProvider.winList[index] == "security") {
                    image = "assets/images/Security.png";
                  }
                  if (userWinsProvider.winList[index] == "nature") {
                    image = "assets/images/Nature.png";
                  }
                  if (userWinsProvider.winList[index] == "wisdom") {
                    image = "assets/images/Wisdom.png";
                  }
                  if (userWinsProvider.winList[index] == "economy") {
                    image = "assets/images/Economy.png";
                  }

                  return Container(
                    height: 60,
                    margin: const EdgeInsets.all(15),
                    child: Image.asset(
                      image,
                      fit: BoxFit.fitHeight,
                    ),
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                for (var data in userWinsProvider.winList) {
                  userWinsProvider.updateUserWin(data);
                }
                userWinsProvider.resetWin();
                gameBoardProvider.setBoard(
                  updateState: "",
                  oldNumber: userWinsProvider.lastIndex,
                  newNumber: -1,
                  context: context,
                );
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(7.5),
                ),
                alignment: Alignment.center,
                height: 35,
                child: const Text(
                  "Collect",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    } else {
      return const SizedBox(
        width: 0,
        height: 0,
      );
    }
  }
}
