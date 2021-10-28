import 'package:busara/src/dashboard/controller/index.dart';
import 'package:busara/src/dashboard/controller/second.dart';
import 'package:busara/src/dashboard/view/index.dart';
import 'package:busara/src/dashboard/view/widget/status_board.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameOver extends StatelessWidget {
  const GameOver({Key? key}) : super(key: key);

  static const routeName = '/gameOver';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Game Over",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () {
                      final gameBoardProvider = Provider.of<GameBoardProvider>(
                          context,
                          listen: false);
                      Navigator.popAndPushNamed(
                          context, DashboardScreen.routeName);
                      gameBoardProvider.startGame();
                      Provider.of<GameBoardFirstProvider>(context,
                              listen: false)
                          .getSetup(restart: true);
                    },
                    child: Container(
                      width: 150,
                      height: 75,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Text(
                        "Play Again",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const StatusBoard()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
