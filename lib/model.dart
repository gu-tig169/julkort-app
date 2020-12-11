import 'package:flutter/material.dart';
import 'package:julkort/api.dart';

String colorToString(Color color) {
  if (color == Colors.blue) return 'blue';
  if (color == Colors.green) return 'green';
  if (color == Colors.grey) return 'grey';
  return 'grey';
}

Color stringToColor(String color) {
  if (color == 'blue') return Colors.blue;
  if (color == 'green') return Colors.green;
  if (color == 'grey') return Colors.grey;
  return Colors.grey;
}

class ChristmasCard {
  String id;
  String message;
  Color color;
  Alignment alignment;

  ChristmasCard({this.id, this.message, this.color, this.alignment});

  static Map<String, dynamic> toJson(ChristmasCard card) {
    return {
      'message': card.message,
      'color': colorToString(card.color),
    };
  }

  static ChristmasCard fromJson(Map<String, dynamic> json) {
    return ChristmasCard(
      id: json['id'],
      message: json['message'],
      color: stringToColor(json['color']),
      alignment: Alignment.center,
    );
  }
}

class MyState extends ChangeNotifier {
  List<ChristmasCard> _list = [];
  String _filterBy = 'all';

  List<ChristmasCard> get list => _list;

  String get filterBy => _filterBy;

  Future getList() async {
    List<ChristmasCard> list = await Api.getCards();
    _list = list;
    notifyListeners();
  }

  void addCard(ChristmasCard card) async {
    await Api.addCard(card);
    await getList();
  }

  void removeCard(ChristmasCard card) async {
    await Api.deleteCard(card.id);
    await getList();
  }

  void setFilterBy(String filterBy) {
    this._filterBy = filterBy;
    notifyListeners();
  }
}
