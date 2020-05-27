import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(Quests());

class _QuestsState extends State<Quests> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      ++_questionIndex;
    });

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'question': 'What is the supreme law of the land?',
        'answers': [
          'the Constitution',
          'incorrect',
          'incorrect',
        ],
      },
      {
        'question': 'What does the Constitution do?',
        'answers': [
          'incorrect',
          'sets up the government',
          'incorrect',
        ],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Glowbom Quests'),
        ),
        body: Column(
          children: <Widget>[
            Question(
              questions[_questionIndex]['question'],
            ),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}

class Quests extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuestsState();
  }
}
