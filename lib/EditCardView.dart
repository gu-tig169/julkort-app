import 'package:flutter/material.dart';
import './model.dart';
import 'ChristmasCardWidget.dart';

class EditCardView extends StatefulWidget {
  final ChristmasCard card;

  EditCardView(this.card);

  @override
  State<StatefulWidget> createState() {
    return EditCardViewState(card);
  }
}

class EditCardViewState extends State<EditCardView> {
  String message;
  Alignment alignment;
  Color color;

  TextEditingController textEditingController;

  EditCardViewState(ChristmasCard card) {
    this.message = card.message;
    this.alignment = card.alignment;
    this.color = card.color;

    textEditingController = TextEditingController(text: card.message);

    textEditingController.addListener(() {
      setState(() {
        message = textEditingController.text;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit card'), actions: [
        FlatButton(
          child: Text('Save', style: TextStyle(color: Colors.white)),
          onPressed: () {
            Navigator.pop(
                context,
                ChristmasCard(
                    message: message, color: color, alignment: alignment));
          },
        )
      ]),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ChristmasCardWidget(ChristmasCard(
              message: this.message,
              color: this.color,
              alignment: this.alignment)),
          TextField(controller: textEditingController),
          Text('Position'),
          DropdownButton(
              value: alignment,
              items: [
                DropdownMenuItem(
                    value: Alignment.bottomRight, child: Text('Bottom right')),
                DropdownMenuItem(
                    value: Alignment.bottomLeft, child: Text('Bottom left')),
                DropdownMenuItem(
                    value: Alignment.center, child: Text('Center')),
              ],
              onChanged: (value) {
                setState(() {
                  alignment = value;
                });
              }),
          Text('Coor'),
          DropdownButton(
            value: color,
            items: [
              DropdownMenuItem(value: Colors.grey, child: Text('Grey')),
              DropdownMenuItem(value: Colors.blue, child: Text('Blue')),
              DropdownMenuItem(value: Colors.green, child: Text('Green')),
            ],
            onChanged: (value) {
              setState(() {
                color = value;
              });
            },
          )
        ]),
      ),
    );
  }
}
