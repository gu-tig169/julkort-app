import 'package:flutter/material.dart';

class ChristmasCard {
  String message;
  Color color;
  Alignment alignment;

  ChristmasCard({this.message, this.color, this.alignment});
}

class MyState extends ChangeNotifier {
  List<ChristmasCard> _list = [];

  List<ChristmasCard> get list => _list;

  void addCard(ChristmasCard card) {
    _list.add(card);
    notifyListeners();
  }

  void removeCard(ChristmasCard card) {
    _list.remove(card);
    notifyListeners();
  }
}
