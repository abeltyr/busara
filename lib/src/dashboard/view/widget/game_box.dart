import 'package:busara/models/board_component.dart';
import 'package:busara/src/dashboard/controller/index.dart';
import 'package:busara/src/dashboard/view/widget/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class GameBox extends StatelessWidget {
  final double size;
  final int number;
  const GameBox({required this.size, required this.number, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameBoardProvider =
        Provider.of<GameBoardProvider>(context, listen: false);
    List<GameBoardModel> data = gameBoardProvider.board;
    return DragTarget(
      onWillAccept: (Object? value) {
        GameBoardModel? stateData = value! as GameBoardModel;
        if (gameBoardProvider.starter &&
            number - 1 >= 0 &&
            data[number - 1].state.isNotEmpty) {
          return false;
        }
        if (gameBoardProvider.starter &&
            number + 1 < data.length &&
            data[number + 1].state.isNotEmpty &&
            number != 3 &&
            number != 7 &&
            number != 11 &&
            number != 15) {
          return false;
        }
        if (gameBoardProvider.starter &&
            number - 4 >= 0 &&
            data[number - 4].state.isNotEmpty) {
          return false;
        }
        if (gameBoardProvider.starter &&
            number + 4 < data.length &&
            data[number + 4].state.isNotEmpty) {
          return false;
        }
        if (stateData.position == -1) return true;
        if (stateData.position - 1 >= 0 && stateData.position - 1 == number) {
          return true;
        }
        if (stateData.position + 1 < data.length &&
            stateData.position + 1 == number) {
          return true;
        }
        if (stateData.position - 1 >= 0 && stateData.position - 1 == number) {
          return true;
        }
        if (stateData.position - 4 >= 0 && stateData.position - 4 == number) {
          return true;
        }
        if (stateData.position + 4 < data.length &&
            stateData.position + 4 == number) {
          return true;
        }
        return false;
      },
      onAccept: (Object? value) {
        GameBoardModel? stateData = value! as GameBoardModel;
        data[number] = GameBoardModel(
          position: number,
          state: stateData.state,
        );
        gameBoardProvider.setBoard(data);
        // gameBoardProvider.setupResource(false);

        gameBoardProvider.setResource("earth");
      },
      builder: (
        BuildContext context,
        List<dynamic> accepted,
        List<dynamic> rejected,
      ) {
        Widget show = const SizedBox(
          width: 0,
          height: 0,
        );
        if (data[number].state.isNotEmpty) {
          show = Draggable(
            data: data[number],
            onDragEnd: (DraggableDetails dragData) {
              if (dragData.wasAccepted) {
                data[number] = GameBoardModel(
                  position: number,
                  state: "",
                );
                gameBoardProvider.setBoard(data);
                // gameBoardProvider.setupResource(false);

                gameBoardProvider.setResource("water");
              }
            },
            child: Resource(data: data[number].state),
            childWhenDragging: const SizedBox(
              width: 0,
              height: 0,
            ),
            feedback: Resource(data: data[number].state),
          );
        }

        return AnimatedContainer(
          duration: const Duration(milliseconds: 3000),
          width: (size - 90) / 4,
          height: (size - 90) / 4,
          padding: const EdgeInsets.all(50),
          child: show,
        );
      },
    );
  }
}
