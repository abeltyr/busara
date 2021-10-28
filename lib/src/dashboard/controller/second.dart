import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class GameBoardFirstProvider with ChangeNotifier {
  List<Map<String, dynamic>> _setup = [];
  List<Map<String, dynamic>> get setup {
    return _setup;
  }

  Future<List<Map<String, dynamic>>> getSetup({bool restart = false}) async {
    if (restart) _setup = [];
    if (setup.isEmpty || restart) {
      var index = 0;
      while (index < 5) {
        Random random = Random();
        int randomNumber = random.nextInt(4);
        switch (randomNumber) {
          case 1:
            _setup.add(
              {
                "state": "fire",
                "used": false,
              },
            );
            break;
          case 2:
            _setup.add(
              {
                "state": "earth",
                "used": false,
              },
            );
            break;
          case 3:
            _setup.add(
              {
                "state": "wind",
                "used": false,
              },
            );
            break;
          default:
            _setup.add(
              {
                "state": "water",
                "used": false,
              },
            );
            break;
        }
        index++;
      }
    }
    return _setup;
  }

  void setBoard(List<Map<String, dynamic>> setupData) {
    _setup = setupData;
    notifyListeners();
  }
}
