import 'dart:math';

import 'package:busara/models/wins.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String start = "assets/images/kingdom/";
final List<WinModal> _kingdoms = [
  WinModal(security: 2, nature: 3, economy: 4),
  WinModal(art: 3, security: 4, nature: 2, image: '$start/2.png'),
  WinModal(art: 2, wisdom: 3, nature: 4, image: '$start/3.png'),
  WinModal(energy: 4, wisdom: 2, economy: 3, image: '$start/4.png'),
  WinModal(art: 4, energy: 2, security: 3, image: '$start/5.png'),
  WinModal(art: 2, nature: 4, economy: 3, image: '$start/6.png'),
  WinModal(energy: 2, nature: 3, economy: 4, image: '$start/7.png'),
  WinModal(energy: 3, security: 4, wisdom: 2, image: '$start/8.png'),
  WinModal(art: 2, energy: 3, wisdom: 4, image: '$start/9.png'),
  WinModal(energy: 4, security: 3, nature: 2, image: '$start/10.png'),
  WinModal(security: 2, wisdom: 3, economy: 4, image: '$start/11.png'),
  WinModal(wisdom: 3, nature: 4, economy: 2, image: '$start/12.png'),
  WinModal(art: 4, wisdom: 3, economy: 2, image: '$start/13.png'),
  WinModal(art: 4, energy: 3, nature: 2, image: '$start/14.png'),
  WinModal(art: 3, security: 4, economy: 2, image: '$start/15.png'),
];

class UserWinsProvider with ChangeNotifier {
  WinModal _userWins = WinModal();
  int _lastIndex = -1;
  List<String> _winList = [];

  WinModal _userRequired = _kingdoms[10];

  generate() {
    Random random = Random();
    int randomNumber = random.nextInt(13);
    _userRequired = _kingdoms[randomNumber + 1];
    _winList = [];
    notifyListeners();
  }

  WinModal get userWins => _userWins;

  List<String> get winList => _winList;

  int get lastIndex => _lastIndex;

  WinModal get userRequired => _userRequired;

  updateUserWin(String win) {
    var data = _userWins;
    if (win == "art") {
      data.art = data.art + 1;
    } else if (win == "security") {
      data.security = data.security + 1;
    } else if (win == "wisdom") {
      data.wisdom = data.wisdom + 1;
    } else if (win == "energy") {
      data.energy = data.energy + 1;
    } else if (win == "economy") {
      data.economy = data.economy + 1;
    } else if (win == "nature") {
      data.nature = data.nature + 1;
    }
    _userWins = data;
    notifyListeners();
  }

  setupWin(WinModal data) {
    _userRequired = data;
    notifyListeners();
  }

  addToList(String data) {
    _winList.add(data);
    notifyListeners();
  }

  updateIndex(int index) {
    _lastIndex = index;
    notifyListeners();
  }

  resetWin() {
    _winList = [];
    notifyListeners();
  }
}
