import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'CardList.dart';
import 'EditCardView.dart';
import 'model.dart';

class CardsListView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mina Julkort')),
      body: Consumer<MyState>(
        builder: (context, state, child) => CardsList(state.list),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          var newCard = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EditCardView(ChristmasCard(
                      message: 'message',
                      color: Colors.grey,
                      alignment: Alignment.bottomRight))));
          if (newCard != null) {
            // Lägg till newCard i listan av julkort.
            Provider.of<MyState>(context, listen: false).addCard(newCard);
          }
        },
      ),
    );
  }
}
