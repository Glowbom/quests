import 'package:flutter/material.dart';

void main() => runApp(Quests());

class QuestsState extends State<Quests> {
  var questionIndex = 0;

  void answerQuestion() {
    setState(() {
      ++questionIndex;
    });
    
    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      'What is the supreme law of the land?',
      'What does the Constitution do?',
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Glowbom Quests'),
        ),
        body: Column(
          children: <Widget>[
            Text(questions[questionIndex]),
            RaisedButton(
              child: Text('Answer 1'),
              onPressed: answerQuestion,
            ),
            RaisedButton(
              child: Text('Answer 2'),
              onPressed: answerQuestion,
            ),
            RaisedButton(
              child: Text('Answer 3'),
              onPressed: answerQuestion,
            ),
          ],
        ),
      ),
    );
  }
}

class Quests extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return QuestsState();
  }
}
