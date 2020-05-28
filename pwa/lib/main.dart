import 'package:flutter/material.dart';
import './result.dart';
import './quiz.dart';

void main() => runApp(Quests());

class _QuestsState extends State<Quests> {
  var _questionIndex = 0;
  var _totalScore = 0;

  final _questions = const [
      {
        "title": "A - Principles of American Democracy: 1",
        "description": "What is the supreme law of the land?",
        "buttonsTexts": [
          "incorrect",
          "the Constitution",
          "incorrect",
          "incorrect"
        ],
        "buttonAnswers": [0, 1, 0, 0],
        "answersCount": 1,
        "goIndexes": [1, 1, 1, 1],
        "answerPicture": "",
        "answerPictureDelay": 0,
        "goConditions": [],
        "heroValues": [],
        "picturesSpriteNames": ["", "", "", "", "", ""]
      },
      {
        "title": "A - Principles of American Democracy: 2",
        "description": "What does the Constitution do?",
        "buttonsTexts": [
          "sets up the government",
          "incorrect",
          "incorrect",
          "incorrect"
        ],
        "buttonAnswers": [1, 0, 0, 0],
        "answersCount": 1,
        "goIndexes": [2, 2, 2, 2],
        "answerPicture": "",
        "answerPictureDelay": 0,
        "goConditions": [],
        "heroValues": [],
        "picturesSpriteNames": ["", "", "", "", "", ""]
      },
      {
        "title": "A - Principles of American Democracy: 3",
        "description":
            "The idea of self-government is in the first three words of the Constitution. What are these words?",
        "buttonsTexts": [
          "incorrect",
          "We the People",
          "incorrect",
          "incorrect"
        ],
        "buttonAnswers": [0, 1, 0, 0],
        "answersCount": 1,
        "goIndexes": [3, 3, 3, 3],
        "answerPicture": "",
        "answerPictureDelay": 0,
        "goConditions": [],
        "heroValues": [],
        "picturesSpriteNames": ["", "", "", "", "", ""]
      }
    ];

  void _restart() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

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
            : Result(_totalScore, _restart),
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
