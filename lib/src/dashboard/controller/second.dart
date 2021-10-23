import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameBoardFirstProvider with ChangeNotifier {
  List<Map<String, dynamic>> _setup = [
    {
      "state": "fire",
      "used": false,
    },
    {
      "state": "earth",
      "used": false,
    },
    {
      "state": "earth",
      "used": false,
    },
    {
      "state": "water",
      "used": false,
    },
    {
      "state": "water",
      "used": false,
    },
  ];
  List<Map<String, dynamic>> get setup {
    return _setup;
  }

  Future<List<Map<String, dynamic>>> getSetup() async {
    return _setup;
  }

  void setBoard(List<Map<String, dynamic>> setupData) {
    _setup = setupData;
    notifyListeners();
  }
}
