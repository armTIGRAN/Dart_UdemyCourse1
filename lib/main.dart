import 'package:flutter/material.dart';

import "./quiz.dart";
import './result.dart';
import './intro.dart';
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
  static const _questions = [
    {
      "QuestionText": "What's your favourite color?",
      "answers": [
        {"text": "red", "score": 5},
        {"text": "purple", "score": 3},
        {"text": "green", "score": 1},
        {"text": "blue", "score": 10}
      ]
    },
    {
      "QuestionText": "What's your favourite animal?",
      "answers": [
        {"text": "cat", "score": 5},
        {"text": "zebre", "score": 10},
        {"text": "dog", "score": 1},
        {"text": "lion", "score": 3}
      ]
    },
    {
      "QuestionText": "What's your favourite film?",
      "answers": [
        {"text": "Avatar", "score": 1},
        {"text": "Man x", "score": 5},
        {"text": "Survived", "score": 3},
        {"text": "Avengers", "score": 10}
      ]
    },
    {
      "QuestionText": "What's your favourite game?",
      "answers": [
        {"text": "pubg", "score": 5},
        {"text": "forest", "score": 3},
        {"text": "assasin's creed", "score": 1},
        {"text": "minecraft", "score": 10}
      ]
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;
  bool _startState = false;

  void _start() {
    setState(() {
      _startState = true;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;

    setState(() {
      _questionIndex += 1;
    });

    if (_questionIndex >= _questions.length) {
      print("No more questions");
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     home: Scaffold(
  //       appBar: AppBar(
  //         title: Text("My First App"),
  //       ),
  //       body: _questionIndex < _questions.length
  //           ? Quiz(
  //               answerQuestion: _answerQuestion,
  //               questionIndex: _questionIndex,
  //               questions: _questions)
  //           : Result(_totalScore, _resetQuiz),
  //     ),
  //   );
  // }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("My First App", style: TextStyle(fontSize: 24)),
          ),
          body: _startState == true
              ? _questionIndex < _questions.length
                  ? Quiz(
                      answerQuestion: _answerQuestion,
                      questionIndex: _questionIndex,
                      questions: _questions)
                  : Result(_totalScore, _resetQuiz)
              : Intro(_start)),
    );
  }
}
