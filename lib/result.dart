import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScope;
  final Function resetHandler;

  Result(this.resultScope, this.resetHandler);

  String get resultPhrase {
    var resultText = "You did it!";
    if (resultScope <= 8) {
      resultText = "You are awesome and innocent!";
    } else if (resultScope <= 12) {
      resultText = 'Pretty likeable';
    } else if (resultScope <= 16) {
      resultText = 'You are ... strange?!';
    } else {
      resultText = "You are so bad!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          FlatButton(
            child: Text("Restart Quiz!"),
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
