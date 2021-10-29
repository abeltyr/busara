import 'package:busara/src/dashboard/controller/index.dart';
import 'package:busara/src/dashboard/controller/second.dart';
import 'package:busara/src/dashboard/controller/wins.dart';
import 'package:busara/src/dashboard/view/index.dart';
import 'package:busara/src/dashboard/view/widget/status_board.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

class GameOver extends StatefulWidget {
  const GameOver({Key? key}) : super(key: key);

  static const routeName = '/gameOver';

  @override
  State<GameOver> createState() => _GameOverState();
}

class _GameOverState extends State<GameOver> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
              child: const RiveAnimation.asset(
                "assets/animations/spaceCoffee.riv",
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 300,
                    child: Lottie.asset(
                      'assets/animations/gameOver.json',
                      controller: _controller,
                      onLoaded: (composition) {
                        // Configure the AnimationController with the duration of the
                        // Lottie file and start the animation.
                        _controller
                          ..duration = composition.duration
                          ..forward();
                      },
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
                      Provider.of<UserWinsProvider>(context, listen: false)
                          .generate();
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
