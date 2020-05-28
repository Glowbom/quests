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
      "buttonsTexts": ["incorrect", "We the People", "incorrect", "incorrect"],
      "buttonAnswers": [0, 1, 0, 0],
      "answersCount": 1,
      "goIndexes": [3, 3, 3, 3],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "A - Principles of American Democracy: 4",
      "description": "What is an amendment?",
      "buttonsTexts": [
        "incorrect",
        "incorrect",
        "incorrect",
        "a change (to the Constitution)"
      ],
      "buttonAnswers": [0, 0, 0, 1],
      "answersCount": 1,
      "goIndexes": [4, 4, 4, 4],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "A - Principles of American Democracy: 5",
      "description":
          "What do we call the first ten amendments to the Constitution?",
      "buttonsTexts": [
        "the Bill of Rights",
        "incorrect",
        "incorrect",
        "incorrect"
      ],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [5, 5, 5, 5],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "A - Principles of American Democracy: 6",
      "description": "What is one right or freedom from the First Amendment?",
      "buttonsTexts": ["incorrect", "incorrect", "speech", "incorrect"],
      "buttonAnswers": [0, 0, 1, 0],
      "answersCount": 1,
      "goIndexes": [6, 6, 6, 6],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "A - Principles of American Democracy: 7",
      "description": "How many amendments does the Constitution have? ",
      "buttonsTexts": ["incorrect", "incorrect", "incorrect", "27"],
      "buttonAnswers": [0, 0, 0, 1],
      "answersCount": 1,
      "goIndexes": [7, 7, 7, 7],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "A - Principles of American Democracy: 8",
      "description": "What did the Declaration of Independence do?",
      "buttonsTexts": [
        "declared our independence (from Great Britain)",
        "incorrect",
        "incorrect",
        "incorrect"
      ],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [8, 8, 8, 8],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "A - Principles of American Democracy: 9",
      "description": "What are two rights in the Declaration of Independence?",
      "buttonsTexts": ["incorrect", "life", "incorrect", "liberty"],
      "buttonAnswers": [0, 1, 0, 1],
      "answersCount": 2,
      "goIndexes": [9, 9, 9, 9],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "A - Principles of American Democracy: 10",
      "description": "What is freedom of religion?",
      "buttonsTexts": [
        "You can practice any religion, or not practice a religion.",
        "incorrect",
        "incorrect",
        "incorrect"
      ],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [10, 10, 10, 10],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "A - Principles of American Democracy: 11",
      "description": "What is the economic system in the United States?",
      "buttonsTexts": [
        "incorrect",
        "incorrect",
        "capitalist economy",
        "incorrect"
      ],
      "buttonAnswers": [0, 0, 1, 0],
      "answersCount": 1,
      "goIndexes": [11, 11, 11, 11],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "A - Principles of American Democracy: 12",
      "description": "What is the “rule of law”?",
      "buttonsTexts": [
        "incorrect",
        "incorrect",
        "incorrect",
        "Everyone must follow the law."
      ],
      "buttonAnswers": [0, 1, 0, 1],
      "answersCount": 2,
      "goIndexes": [12, 12, 12, 12],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "B - System of Government: 13",
      "description": "Name one branch or part of the government.",
      "buttonsTexts": ["incorrect", "Congress", "incorrect", "incorrect"],
      "buttonAnswers": [0, 1, 0, 0],
      "answersCount": 1,
      "goIndexes": [13, 13, 13, 13],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "B - System of Government: 14",
      "description":
          "What stops one branch of government from becoming too powerful?",
      "buttonsTexts": [
        "checks and balances",
        "incorrect",
        "incorrect",
        "incorrect"
      ],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [14, 14, 14, 14],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "B - System of Government: 15",
      "description": "Who is in charge of the executive branch?",
      "buttonsTexts": ["incorrect", "incorrect", "the President", "incorrect"],
      "buttonAnswers": [0, 0, 1, 0],
      "answersCount": 1,
      "goIndexes": [15, 15, 15, 15],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "B - System of Government: 16",
      "description": "Who makes federal laws?",
      "buttonsTexts": ["Congress", "incorrect", "incorrect", "incorrect"],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [16, 16, 16, 16],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "B - System of Government: 17",
      "description": "What are the two parts of the U.S. Congress?",
      "buttonsTexts": [
        "incorrect",
        "incorrect",
        "the Senate and House",
        "incorrect"
      ],
      "buttonAnswers": [0, 0, 1, 0],
      "answersCount": 1,
      "goIndexes": [17, 17, 17, 17],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "B - System of Government: 18",
      "description": "How many U.S. Senators are there?",
      "buttonsTexts": ["120", "50", "60", "100"],
      "buttonAnswers": [0, 0, 0, 1],
      "answersCount": 1,
      "goIndexes": [18, 18, 18, 18],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "B - System of Government: 19",
      "description": "We elect a U.S. Senator for how many years?",
      "buttonsTexts": ["3", "4", "6", "5"],
      "buttonAnswers": [0, 0, 1, 0],
      "answersCount": 1,
      "goIndexes": [19, 19, 19, 19],
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
