import 'dart:math';

import 'package:busara/models/board_component.dart';
import 'package:busara/src/gameOver/view/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameBoardProvider with ChangeNotifier {
  bool _showResource = true;
  bool _starter = true;
  String _resource = "wind";
  late final List<GameBoardModel> _startBoard = [
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

  List<GameBoardModel> _board = [
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

  void setResource() {
    Random random = Random();
    int randomNumber = random.nextInt(4);
    setupResource(true);
    switch (randomNumber) {
      case 1:
        _resource = "fire";
        notifyListeners();
        return;
      case 2:
        _resource = "earth";
        notifyListeners();
        return;
      case 3:
        _resource = "wind";
        notifyListeners();
        return;
      default:
        _resource = "water";
        notifyListeners();
        return;
    }
  }

  bool get starter {
    return _starter;
  }

  void setStarter() {
    _starter = false;
    notifyListeners();
  }

  void startGame() {
    _board = _startBoard;
    _starter = true;
  }

  Future<List<GameBoardModel>> setBoard({
    required String updateState,
    required int oldNumber,
    required int newNumber,
    BuildContext? context,
  }) async {
    if (newNumber >= 0) _board[newNumber].state = updateState;
    if (oldNumber >= 0) _board[oldNumber].state = "";
    int count = _board.where((element) => element.state.isNotEmpty).length;
    int empty = _board.where((element) => element.state.isEmpty).length;

    if ((empty == _board.length || count == _board.length) && context != null) {
      Navigator.popAndPushNamed(context, GameOver.routeName);
    }
    if (count >= 5 && _starter) {
      _starter = false;
      setResource();
    }
    notifyListeners();
    return _board;
  }

  void setupResource(bool data) {
    _showResource = data;
    notifyListeners();
  }
}
