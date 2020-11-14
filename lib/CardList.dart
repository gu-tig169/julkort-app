import 'package:flutter/material.dart';
import 'package:julkort/ChristmasCardWidget.dart';
import 'package:provider/provider.dart';

import 'model.dart';

class CardsList extends StatelessWidget {
  final List<ChristmasCard> list;

  CardsList(this.list);

  Widget build(BuildContext context) {
    return ListView(
        children: list.map((card) => _cardItem(context, card)).toList());
  }

  Widget _cardItem(context, card) {
    return ListTile(
        leading: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(color: card.color),
        ),
        title: Text(card.message),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            var state = Provider.of<MyState>(context, listen: false);
            state.removeCard(card);
          },
        ),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CardView(card)));
        });
  }
}

class CardView extends StatelessWidget {
  final ChristmasCard card;
  CardView(this.card);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: ChristmasCardWidget(card)),
    );
  }
}
