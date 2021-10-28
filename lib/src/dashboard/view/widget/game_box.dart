import 'package:busara/models/board_component.dart';
import 'package:busara/src/dashboard/controller/index.dart';
import 'package:busara/src/dashboard/controller/wins.dart';
import 'package:busara/src/dashboard/view/widget/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class GameBox extends StatelessWidget {
  final double size;
  final int number;
  const GameBox({required this.size, required this.number, Key? key})
      : super(key: key);

  String forging(String state1, String state2) {
    if (state1 == 'fire' && state2 == 'water') {
      return 'art';
    } else if (state1 == 'fire' && state2 == 'earth') {
      return 'security';
    } else if (state1 == 'fire' && state2 == 'wind') {
      return 'wisdom';
    } else if (state1 == 'wind' && state2 == 'earth') {
      return 'energy';
    } else if (state1 == 'wind' && state2 == 'water') {
      return 'economy';
    } else if (state1 == 'water' && state2 == 'earth') {
      return 'nature';
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final gameBoardProvider =
        Provider.of<GameBoardProvider>(context, listen: true);
    final userWinsProvider =
        Provider.of<UserWinsProvider>(context, listen: false);

    List<GameBoardModel> data = gameBoardProvider.board;

    bool startMove(GameBoardModel stateData) {
      if (number - 1 >= 0 &&
          data[number - 1].state.isNotEmpty &&
          number != 0 &&
          number != 4 &&
          number != 8 &&
          number != 12) {
        return false;
      }
      if (number + 1 < data.length &&
          data[number + 1].state.isNotEmpty &&
          number != 3 &&
          number != 7 &&
          number != 11 &&
          number != 15) {
        return false;
      }
      if (number - 4 >= 0 && data[number - 4].state.isNotEmpty) {
        return false;
      }
      if (number + 4 < data.length && data[number + 4].state.isNotEmpty) {
        return false;
      }
      if (stateData.position != -1) return false;
      return true;
    }

    bool movement(GameBoardModel stateData) {
      if (userWinsProvider.winList.isNotEmpty) {
        if (stateData.position - 1 >= 0 &&
            stateData.position - 1 == number &&
            data[number].state.isNotEmpty) {
          return true;
        }
        if (stateData.position + 1 < data.length &&
            stateData.position + 1 == number &&
            data[number].state.isNotEmpty) {
          return true;
        }
        if (stateData.position - 1 >= 0 &&
            stateData.position - 1 == number &&
            data[number].state.isNotEmpty) {
          return true;
        }
        if (stateData.position - 4 >= 0 &&
            stateData.position - 4 == number &&
            data[number].state.isNotEmpty) {
          return true;
        }
        if (stateData.position + 4 < data.length &&
            stateData.position + 4 == number &&
            data[number].state.isNotEmpty) {
          return true;
        }
        return false;
      }
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
    }

    void winMovement(GameBoardModel stateData) async {
      String res = forging(stateData.state, data[number].state);
      String res1 = forging(
        data[number].state,
        stateData.state,
      );
      String virtue = "";
      if (res == res1 || res.isNotEmpty) {
        virtue = res;
      } else if (res.isEmpty && res1.isNotEmpty) {
        virtue = res1;
      }
      var newData = await gameBoardProvider.setBoard(
        updateState: data[number].state,
        oldNumber: stateData.position,
        newNumber: number,
        context: context,
      );
      if (userWinsProvider.winList.isNotEmpty ||
          (number - 1 >= 0 &&
              newData[number - 1].state.isNotEmpty &&
              newData[number - 1].state != newData[number].state) ||
          (number + 1 < newData.length &&
              newData[number + 1].state.isNotEmpty &&
              newData[number + 1].state != newData[number].state) ||
          (number - 4 >= 0 &&
              newData[number - 4].state.isNotEmpty &&
              newData[number - 4].state != newData[number].state) ||
          (number + 4 < newData.length &&
              newData[number + 4].state.isNotEmpty &&
              newData[number + 4].state != newData[number].state)) {
        userWinsProvider.addToList(virtue);
        userWinsProvider.updateIndex(number);
      } else {
        userWinsProvider.updateUserWin(virtue);
        await gameBoardProvider.setBoard(
          updateState: "",
          oldNumber: number,
          newNumber: -1,
          context: context,
        );
      }
    }

    return DragTarget(
      onWillAccept: (Object? value) {
        GameBoardModel? stateData = value! as GameBoardModel;
        //Rule for the first 5 pc of the resource
        if (gameBoardProvider.starter) {
          bool res = startMove(stateData);
          if (!res) return res;
        }

        //Rule for the overlaying a resource with a secondary resource
        if (data[number].state.isNotEmpty && stateData.position == -1) {
          return false;
        }

        if (data[number].state.isNotEmpty &&
            stateData.state == data[number].state) {
          return false;
        }

        //Rule for the resource drawn
        if (stateData.position == -1) return true;

        //Rule for the movement of resource found inside the board so that it can only move
        // up, down, left, right
        bool res2 = movement(stateData);

        return res2;
      },
      onAccept: (Object? value) {
        GameBoardModel? stateData = value! as GameBoardModel;
        // Rule for the overlaying a resource with a secondary resource
        if (data[number].state.isNotEmpty) {
          winMovement(stateData);
        } else {
          gameBoardProvider.setBoard(
            updateState: stateData.state,
            oldNumber: stateData.position,
            newNumber: number,
            context: context,
          );
        }
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
                gameBoardProvider.setBoard(
                  newNumber: -1,
                  oldNumber: number,
                  updateState: "",
                  context: context,
                );
                gameBoardProvider.setResource();
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
