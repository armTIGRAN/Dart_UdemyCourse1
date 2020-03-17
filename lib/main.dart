import 'package:flutter/material.dart';

import "./question.dart";
// void main(){
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
} 

class _MyAppState extends State<MyApp> {
  int _questionIndex=0;

  void answerQuestion(){
    setState(() {
      if(_questionIndex<questions.length-1){
        _questionIndex+=1;
      }
    });
    print("Answer 1 chosen");
  }

  var questions = [
    "What's your favourite color?",
    "What's your favourite animal?",
    "What's your favourite film?",
    "What's your favourite game?"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("My First App"), ),
        body: Column(children: <Widget>[
          Question(questions[_questionIndex]),
          RaisedButton(child:Text("Answer1"), onPressed: answerQuestion),
          RaisedButton(child:Text("Answer2"), onPressed: () => print("Answer 2 chosen")),
          RaisedButton(child:Text("Answer3"), onPressed: (){
            //some code
            print("Answer 3 chosen");
          }),
        ],)
      ),  
    );  
  }
}