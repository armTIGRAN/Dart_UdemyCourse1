import 'package:flutter/material.dart';

import "./question.dart";
import './answer.dart';
// void main(){
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  static const questions = [
    {
      "QuestionText": "What's your favourite color?",
      "answers": ["blue", "red", "purple", "green"]
    },
    {
      "QuestionText": "What's your favourite animal?",
      "answers": ["dog", "cat", "elephant", "zebre", "pig"]
    },
    {
      "QuestionText": "What's your favourite film?",
      "answers": ["avengers", "avatar", "survived"]
    },
    {
      "QuestionText": "What's your favourite game?",
      "answers": ["minecraft", "csgo", "pubg", 'forest', 'assasin\'s creed']
    }
  ];

  int _questionIndex = 0;

  void _answerQuestion() {
    print(_questionIndex);
    // print(questions.length);
    setState(() {
      _questionIndex += 1;
    });
    print("Answer chosen");
    if (_questionIndex >= questions.length) {
      print("No more questions");
    }
  }

  @override
  Widget build(BuildContext context) {
    var answers;
    if (_questionIndex < questions.length) {
      answers = questions[_questionIndex]["answers"] as List;
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: _questionIndex < questions.length
            ? Column(
                children: <Widget>[
                  Question(questions[_questionIndex]["QuestionText"]),
                  for (var i = 0; i < answers.length; i++)
                    Answer(_answerQuestion, answers[i])
                ],
              )
            : Center(child: Text("You did it!")),
      ),
    );
  }
}
