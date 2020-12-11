import 'dart:convert';

import 'package:julkort/model.dart';
import 'package:http/http.dart' as http;

const API_URL = 'https://CHANGE_ME_TO_SOMETHING.com';
const API_KEY = 'the-api-key-you-will-get';

class Api {
  static Future addCard(ChristmasCard card) async {
    print(card);
    Map<String, dynamic> json = ChristmasCard.toJson(card);
    var bodyString = jsonEncode(json);
    print(json);
    await http.post(
      '$API_URL/julkort?key=$API_KEY',
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
    );
    print('done');
  }

  static Future deleteCard(String cardId) async {
    await http.delete('$API_URL/julkort/$cardId?key=$API_KEY');
  }

  static Future<List<ChristmasCard>> getCards() async {
    var response = await http.get('$API_URL/julkort?key=$API_KEY');
    String bodyString = response.body;
    print(response.body);
    var json = jsonDecode(bodyString);
    print(json);

    return json.map<ChristmasCard>((data) {
      return ChristmasCard.fromJson(data);
    }).toList();
  }
}
