import 'package:busara/models/wins.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserWinsProvider with ChangeNotifier {
  WinModal _userWins = WinModal();
  WinModal _userRequired = WinModal(
    art: 2,
    economy: 4,
    security: 3,
  );

  WinModal get userWins => _userWins;

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
}
