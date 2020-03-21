import 'package:flutter/material.dart';

class Intro extends StatelessWidget {
  final Function start;

  Intro(this.start);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Text("Made by Tigran Badalyan"),
        FlatButton(
          child: Text("start"),
          onPressed: start,
        )
      ],
    ));
  }
}
