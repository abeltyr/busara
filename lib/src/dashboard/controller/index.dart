import 'package:busara/models/board_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameBoardProvider with ChangeNotifier {
  bool _showResource = true;
  bool _starter = true;
  String _resource = "wind";
  late List<GameBoardModel> _board = [
    GameBoardModel(
      position: 0,
      state: "",
    ),
    GameBoardModel(
      position: 1,
      state: "",
    ),
    GameBoardModel(
      position: 2,
      state: "",
    ),
    GameBoardModel(
      position: 3,
      state: "",
    ),
    GameBoardModel(
      position: 4,
      state: "",
    ),
    GameBoardModel(
      position: 5,
      state: "",
    ),
    GameBoardModel(
      position: 6,
      state: "",
    ),
    GameBoardModel(
      position: 7,
      state: "",
    ),
    GameBoardModel(
      position: 8,
      state: "",
    ),
    GameBoardModel(
      position: 9,
      state: "",
    ),
    GameBoardModel(
      position: 10,
      state: "",
    ),
    GameBoardModel(
      position: 11,
      state: "",
    ),
    GameBoardModel(
      position: 12,
      state: "",
    ),
    GameBoardModel(
      position: 13,
      state: "",
    ),
    GameBoardModel(
      position: 14,
      state: "",
    ),
    GameBoardModel(
      position: 15,
      state: "",
    ),
    GameBoardModel(
      position: 16,
      state: "",
    ),
  ];

  List<GameBoardModel> get board {
    return _board;
  }

  bool get showResource {
    return _showResource;
  }

  String get resource {
    return _resource;
  }

  void setResource(String resource) {
    _resource = resource;
    notifyListeners();
  }

  bool get starter {
    return _starter;
  }

  void setStarter() {
    _starter = false;
    notifyListeners();
  }

  void setBoard(List<GameBoardModel> board) {
    _board = board;
    notifyListeners();
  }

  void setupResource(bool data) {
    _showResource = data;
    notifyListeners();
  }
}
