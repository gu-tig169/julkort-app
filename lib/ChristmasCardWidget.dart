import 'package:flutter/material.dart';

import 'model.dart';

class ChristmasCardWidget extends StatelessWidget {
  final ChristmasCard card;

  ChristmasCardWidget(this.card);

  Widget build(BuildContext context) {
    return Container(
      height: 411,
      decoration: BoxDecoration(color: card.color),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Align(alignment: card.alignment, child: Text(card.message)),
      ),
    );
  }
}
