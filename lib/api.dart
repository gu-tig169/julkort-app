import 'dart:convert';

import 'package:julkort/model.dart';
import 'package:http/http.dart' as http;

const API_KEY = '2d8b24a5-c30d-4cb6-bc35-e2b1bedfd5b4';
const API_URL = 'http://10.0.2.2:3000';

class Api {
  static Future<List<ChristmasCard>> addCard(ChristmasCard card) async {
    Map<String, dynamic> json = ChristmasCard.toJson(card);
    var bodyString = jsonEncode(json);
    var response = await http.post(
      '$API_URL/julkort?key=$API_KEY',
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
    );
    bodyString = response.body;
    var list = jsonDecode(bodyString);

    return list.map<ChristmasCard>((data) {
      return ChristmasCard.fromJson(data);
    }).toList();
  }

  static Future deleteCard(String cardId) async {
    var response = await http.delete('$API_URL/julkort/$cardId?key=$API_KEY&_confirm=true');
    var bodyString = response.body;
    var list = jsonDecode(bodyString);

    return list.map<ChristmasCard>((data) {
      return ChristmasCard.fromJson(data);
    }).toList();
  }

  static Future<List<ChristmasCard>> getCards() async {
    var response = await http.get('$API_URL/julkort?key=$API_KEY');
    String bodyString = response.body;
    var json = jsonDecode(bodyString);

    return json.map<ChristmasCard>((data) {
      return ChristmasCard.fromJson(data);
    }).toList();
  }
}
