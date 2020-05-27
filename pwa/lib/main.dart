import 'package:flutter/material.dart';
import './result.dart';
import './quiz.dart';

void main() => runApp(Quests());

class _QuestsState extends State<Quests> {
  var _questionIndex = 0;

  final _questions = const [
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

  void _answerQuestion() {
    setState(() {
      ++_questionIndex;
    });

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Glowbom Quests'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(),
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
