import 'package:busara/models/board_component.dart';
import 'package:busara/src/dashboard/controller/second.dart';
import 'package:busara/src/dashboard/view/widget/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StarterBoard extends StatelessWidget {
  const StarterBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return const SizedBox(
            height: 0,
            width: 0,
          );
        }
        List<Map<String, dynamic>> setup =
            snapshot.data as List<Map<String, dynamic>>;

        if (setup.where((element) => element["used"]).length < 5) {
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (!setup[0]["used"])
                      Draggable(
                        onDragEnd: (DraggableDetails dragData) {
                          if (dragData.wasAccepted) {
                            setup[0]["used"] = true;
                            Provider.of<GameBoardFirstProvider>(context,
                                    listen: false)
                                .setBoard(setup);
                          }
                        },
                        data: GameBoardModel(
                          state: setup[0]["state"],
                          position: -1,
                        ),
                        child: Resource(data: setup[0]["state"]),
                        childWhenDragging: const SizedBox(
                          width: 0,
                          height: 0,
                        ),
                        feedback: Resource(data: setup[0]["state"]),
                      ),
                    if (!setup[1]["used"])
                      Draggable(
                        onDragEnd: (DraggableDetails dragData) {
                          if (dragData.wasAccepted) {
                            setup[1]["used"] = true;
                            Provider.of<GameBoardFirstProvider>(context,
                                    listen: false)
                                .setBoard(setup);
                          }
                        },
                        data: GameBoardModel(
                          state: setup[1]["state"],
                          position: -1,
                        ),
                        child: Resource(data: setup[1]["state"]),
                        childWhenDragging: const SizedBox(
                          width: 0,
                          height: 0,
                        ),
                        feedback: Resource(data: setup[1]["state"]),
                      ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (!setup[2]["used"])
                      Draggable(
                        onDragEnd: (DraggableDetails dragData) {
                          if (dragData.wasAccepted) {
                            setup[2]["used"] = true;
                            Provider.of<GameBoardFirstProvider>(context,
                                    listen: false)
                                .setBoard(setup);
                          }
                        },
                        data: GameBoardModel(
                          state: setup[2]["state"],
                          position: -1,
                        ),
                        child: Resource(data: setup[2]["state"]),
                        childWhenDragging: const SizedBox(
                          width: 0,
                          height: 0,
                        ),
                        feedback: Resource(data: setup[2]["state"]),
                      ),
                    if (!setup[3]["used"])
                      Draggable(
                        onDragEnd: (DraggableDetails dragData) {
                          if (dragData.wasAccepted) {
                            setup[3]["used"] = true;
                            Provider.of<GameBoardFirstProvider>(context,
                                    listen: false)
                                .setBoard(setup);
                          }
                        },
                        data: GameBoardModel(
                          state: setup[3]["state"],
                          position: -1,
                        ),
                        child: Resource(data: setup[3]["state"]),
                        childWhenDragging: const SizedBox(
                          width: 0,
                          height: 0,
                        ),
                        feedback: Resource(data: setup[3]["state"]),
                      ),
                    if (!setup[4]["used"])
                      Draggable(
                        onDragEnd: (DraggableDetails dragData) {
                          if (dragData.wasAccepted) {
                            setup[4]["used"] = true;
                            Provider.of<GameBoardFirstProvider>(context,
                                    listen: false)
                                .setBoard(setup);
                          }
                        },
                        data: GameBoardModel(
                          state: setup[4]["state"],
                          position: -1,
                        ),
                        child: Resource(data: setup[4]["state"]),
                        childWhenDragging: const SizedBox(
                          width: 0,
                          height: 0,
                        ),
                        feedback: Resource(data: setup[4]["state"]),
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
      future:
          Provider.of<GameBoardFirstProvider>(context, listen: true).getSetup(),
    );
  }
}
