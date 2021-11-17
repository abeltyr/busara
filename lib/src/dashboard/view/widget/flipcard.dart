import 'dart:async';

import 'package:busara/models/board_component.dart';
import 'package:busara/src/dashboard/controller/index.dart';
import 'package:busara/src/dashboard/view/widget/resource.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FlipCardWidget extends StatefulWidget {
  const FlipCardWidget({Key? key}) : super(key: key);

  @override
  _FlipCardWidgetState createState() => _FlipCardWidgetState();
}

class _FlipCardWidgetState extends State<FlipCardWidget> {
  late FlipCardController _controller;

  @override
  void initState() {
    super.initState();
    _controller = FlipCardController();
  }

  Widget display({required Widget childData, required bool rotate}) {
    return GestureDetector(
      onTap: () {
        if (rotate) _controller.toggleCard();
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: childData,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final gameBoardProvider =
        Provider.of<GameBoardProvider>(context, listen: true);
    if (!gameBoardProvider.starter) {
      return FlipCard(
        fill: Fill.fillBack,
        flipOnTouch: false,
        controller: _controller,
        onFlip: () {},
        direction: FlipDirection.HORIZONTAL, // default
        front: display(
          rotate: true,
          childData: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: 250,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "assets/images/Back.png",
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              const Positioned(
                left: 1,
                right: 1,
                top: 100,
                child: Text(
                  "BUSARA",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              )
            ],
          ),
        ),
        back: display(
          rotate: false,
          childData: SizedBox(
            width: 300,
            height: 250,
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "assets/images/Back.png",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                if (gameBoardProvider.showResource)
                  Positioned(
                    left: 75,
                    right: 75,
                    top: 50,
                    bottom: 50,
                    child: SizedBox(
                      width: 125,
                      height: 125,
                      child: Draggable(
                        onDragEnd: (DraggableDetails dragData) {
                          if (dragData.wasAccepted) {
                            _controller.toggleCard();
                            gameBoardProvider.setupResource(false);
                            Timer(const Duration(milliseconds: 1000), () {
                              gameBoardProvider.setResource();
                            });
                          }
                        },
                        data: GameBoardModel(
                          state: gameBoardProvider.resource,
                          position: -1,
                        ),
                        child: Resource(data: gameBoardProvider.resource),
                        childWhenDragging: const SizedBox(
                          width: 0,
                          height: 0,
                        ),
                        feedback: SizedBox(
                          width: 125,
                          height: 125,
                          child: Resource(
                            data: gameBoardProvider.resource,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
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
