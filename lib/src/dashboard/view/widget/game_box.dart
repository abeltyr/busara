import 'package:busara/models/board_component.dart';
import 'package:busara/src/dashboard/controller/index.dart';
import 'package:busara/src/dashboard/view/widget/resource.dart';
import 'package:busara/utils/color_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class GameBox extends StatelessWidget {
  final double size;
  final int number;
  GameBox({required this.size, required this.number, Key? key})
      : super(key: key);

  bool show = false;
  @override
  Widget build(BuildContext context) {
    final gameBoardProvider =
        Provider.of<GameBoardProvider>(context, listen: false);
    List<GameBoardModel> data = gameBoardProvider.board;
    return DragTarget(
      onAccept: (Object? value) {
        String? stateData = value as String;
        print(stateData);
        data[number] = GameBoardModel(
          position: number,
          state: stateData,
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
            data: data[number].state,
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
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: PlatformColorTheme.white,
            ),
          ),
          padding: const EdgeInsets.all(50),
          child: show,
        );
      },
    );
  }
}
