import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'CardList.dart';
import 'EditCardView.dart';
import 'model.dart';

class CardsListView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mina Julkort'),
        actions: [
          PopupMenuButton(
              onSelected: (value) {
                Provider.of<MyState>(context, listen: false).setFilterBy(value);
              },
              itemBuilder: (context) => [
                    PopupMenuItem(child: Text('all'), value: 'all'),
                    PopupMenuItem(child: Text('blue'), value: 'blue'),
                    PopupMenuItem(child: Text('green'), value: 'green'),
                    PopupMenuItem(child: Text('grey'), value: 'grey'),
                  ]),
        ],
      ),
      body: Consumer<MyState>(
        builder: (context, state, child) =>
            CardsList(_filterList(state.list, state.filterBy)),
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

  List<ChristmasCard> _filterList(list, filterBy) {
    if (filterBy == 'all') return list;
    if (filterBy == 'green')
      return list.where((item) => item.color == Colors.green).toList();
    if (filterBy == 'blue')
      return list.where((item) => item.color == Colors.blue).toList();
    if (filterBy == 'grey')
      return list.where((item) => item.color == Colors.grey).toList();
    return null;
  }
}
