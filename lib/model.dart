import 'package:flutter/material.dart';

class ChristmasCard {
  String message;
  Color color;
  Alignment alignment;

  ChristmasCard({this.message, this.color, this.alignment});
}

class MyState extends ChangeNotifier {
  List<ChristmasCard> _list = [];
  String _filterBy = 'all';

  List<ChristmasCard> get list => _list;

  String get filterBy => _filterBy;

  void addCard(ChristmasCard card) {
    _list.add(card);
    notifyListeners();
  }

  void removeCard(ChristmasCard card) {
    _list.remove(card);
    notifyListeners();
  }

  void setFilterBy(String filterBy) {
    this._filterBy = filterBy;
    notifyListeners();
  }
}
