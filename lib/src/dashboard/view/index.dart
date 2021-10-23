import 'package:busara/models/board_component.dart';
import 'package:busara/src/dashboard/controller/index.dart';
import 'package:busara/src/dashboard/controller/second.dart';
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
              SizedBox(
                height: MediaQuery.of(context).size.height - 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FutureBuilder(
                      builder: (context, snapshot) {
                        if (snapshot.data == null) {
                          return const SizedBox(
                            height: 0,
                            width: 0,
                          );
                        }
                        List<Map<String, dynamic>> setup =
                            snapshot.data as List<Map<String, dynamic>>;

                        if (setup.where((element) => element["used"]).length <
                            5) {
                          return Container(
                            width: 500,
                            height: 300,
                            margin: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    if (!setup[0]["used"])
                                      Draggable(
                                        onDragEnd: (DraggableDetails dragData) {
                                          if (dragData.wasAccepted) {
                                            setup[0]["used"] = true;
                                            Provider.of<GameBoardFirstProvider>(
                                                    context,
                                                    listen: false)
                                                .setBoard(setup);
                                          }
                                        },
                                        data: GameBoardModel(
                                          state: setup[0]["state"],
                                          position: -1,
                                        ),
                                        child:
                                            Resource(data: setup[0]["state"]),
                                        childWhenDragging: const SizedBox(
                                          width: 0,
                                          height: 0,
                                        ),
                                        feedback:
                                            Resource(data: setup[0]["state"]),
                                      ),
                                    if (!setup[1]["used"])
                                      Draggable(
                                        onDragEnd: (DraggableDetails dragData) {
                                          if (dragData.wasAccepted) {
                                            setup[1]["used"] = true;
                                            Provider.of<GameBoardFirstProvider>(
                                                    context,
                                                    listen: false)
                                                .setBoard(setup);
                                          }
                                        },
                                        data: GameBoardModel(
                                          state: setup[1]["state"],
                                          position: -1,
                                        ),
                                        child:
                                            Resource(data: setup[1]["state"]),
                                        childWhenDragging: const SizedBox(
                                          width: 0,
                                          height: 0,
                                        ),
                                        feedback:
                                            Resource(data: setup[1]["state"]),
                                      ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    if (!setup[2]["used"])
                                      Draggable(
                                        onDragEnd: (DraggableDetails dragData) {
                                          if (dragData.wasAccepted) {
                                            setup[2]["used"] = true;
                                            Provider.of<GameBoardFirstProvider>(
                                                    context,
                                                    listen: false)
                                                .setBoard(setup);
                                          }
                                        },
                                        data: GameBoardModel(
                                          state: setup[2]["state"],
                                          position: -1,
                                        ),
                                        child:
                                            Resource(data: setup[2]["state"]),
                                        childWhenDragging: const SizedBox(
                                          width: 0,
                                          height: 0,
                                        ),
                                        feedback:
                                            Resource(data: setup[2]["state"]),
                                      ),
                                    if (!setup[3]["used"])
                                      Draggable(
                                        onDragEnd: (DraggableDetails dragData) {
                                          if (dragData.wasAccepted) {
                                            setup[3]["used"] = true;
                                            Provider.of<GameBoardFirstProvider>(
                                                    context,
                                                    listen: false)
                                                .setBoard(setup);
                                          }
                                        },
                                        data: GameBoardModel(
                                          state: setup[3]["state"],
                                          position: -1,
                                        ),
                                        child:
                                            Resource(data: setup[3]["state"]),
                                        childWhenDragging: const SizedBox(
                                          width: 0,
                                          height: 0,
                                        ),
                                        feedback:
                                            Resource(data: setup[3]["state"]),
                                      ),
                                    if (!setup[4]["used"])
                                      Draggable(
                                        onDragEnd: (DraggableDetails dragData) {
                                          if (dragData.wasAccepted) {
                                            setup[4]["used"] = true;
                                            Provider.of<GameBoardFirstProvider>(
                                                    context,
                                                    listen: false)
                                                .setBoard(setup);
                                          }
                                        },
                                        data: GameBoardModel(
                                          state: setup[4]["state"],
                                          position: -1,
                                        ),
                                        child:
                                            Resource(data: setup[4]["state"]),
                                        childWhenDragging: const SizedBox(
                                          width: 0,
                                          height: 0,
                                        ),
                                        feedback:
                                            Resource(data: setup[4]["state"]),
                                      ),
                                  ],
                                )
                              ],
                            ),
                          );
                        } else {
                          return const SizedBox(width: 0, height: 0);
                        }
                      },
                      future: Provider.of<GameBoardFirstProvider>(context,
                              listen: true)
                          .getSetup(),
                    ),
                    if (!gameBoardProvider.starter)
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: Draggable(
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

                    // Container(
                    //   width: 500,
                    //   height: 350,
                    //   color: PlatformColorTheme.primaryColor,
                    //   child: Column(
                    //     children: [
                    //       Row(
                    //         children: [
                    //           Container(
                    //             width: 160,
                    //             height: 160,
                    //             decoration: BoxDecoration(
                    //                 border: Border.all(
                    //               color: PlatformColorTheme.white,
                    //               width: 2,
                    //             )),
                    //             child: Column(
                    //               mainAxisAlignment:
                    //                   MainAxisAlignment.spaceBetween,
                    //               children: [
                    //                 Container(
                    //                   height: 106,
                    //                   color: Colors.red,
                    //                 ),
                    //                 SizedBox(
                    //                   height: 50,
                    //                   child: Image.asset(
                    //                     "assets/images/Art.png",
                    //                     width: 100,
                    //                   ),
                    //                 )
                    //               ],
                    //             ),
                    //           ),
                    //           const SizedBox(
                    //             width: 10,
                    //           ),
                    //           Container(
                    //             width: 160,
                    //             height: 160,
                    //             decoration: BoxDecoration(
                    //                 border: Border.all(
                    //               color: PlatformColorTheme.white,
                    //               width: 2,
                    //             )),
                    //           ),
                    //           const SizedBox(
                    //             width: 10,
                    //           ),
                    //           Container(
                    //             width: 160,
                    //             height: 160,
                    //             decoration: BoxDecoration(
                    //                 border: Border.all(
                    //               color: PlatformColorTheme.white,
                    //               width: 2,
                    //             )),
                    //           ),
                    //         ],
                    //       ),
                    //       const SizedBox(height: 20),
                    //       Row(
                    //         children: [
                    //           Container(
                    //             width: 160,
                    //             height: 160,
                    //             decoration: BoxDecoration(
                    //                 border: Border.all(
                    //               color: PlatformColorTheme.white,
                    //               width: 2,
                    //             )),
                    //           ),
                    //           const SizedBox(
                    //             width: 10,
                    //           ),
                    //           Container(
                    //             width: 160,
                    //             height: 160,
                    //             decoration: BoxDecoration(
                    //                 border: Border.all(
                    //               color: PlatformColorTheme.white,
                    //               width: 2,
                    //             )),
                    //           ),
                    //           const SizedBox(
                    //             width: 10,
                    //           ),
                    //           Container(
                    //             width: 160,
                    //             height: 160,
                    //             decoration: BoxDecoration(
                    //                 border: Border.all(
                    //               color: PlatformColorTheme.white,
                    //               width: 2,
                    //             )),
                    //           ),
                    //         ],
                    //       )
                    //     ],
                    //   ),
                    // )
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
