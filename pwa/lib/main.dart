import 'package:flutter/material.dart';
import './result.dart';
import './quiz.dart';

void main() => runApp(Quests());

class _QuestsState extends State<Quests> {
  var _questionIndex = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      "title": "Japan 1 of 30",
      "description": "Name the warriors in feudal Japan...",
      "buttonsTexts": ["Geisha", "Samurai", "Emperor", "Ask Friend"],
      "buttonAnswers": [0, 1, 0, 0],
      "answersCount": 1,
      "goIndexes": [1, 1, 1, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Japan 2 of 30",
      "description":
          "What is the name of the company that makes Panasonic products?",
      "buttonsTexts": [
        "Matsushita Electric",
        "Samsung Electric",
        "Toshiba",
        "Ask Friend"
      ],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [2, 2, 2, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Japan 3 of 30",
      "description": "What is the main island of Japan called?",
      "buttonsTexts": ["Honshu", "Odaiba", "Maishima", "Ask Friend"],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [3, 3, 3, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Japan 4 of 30",
      "description": "What does \"kamikaze\" literally mean?",
      "buttonsTexts": ["Divine wind", "Fast move", "Strong mind", "Ask Friend"],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [4, 4, 4, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Japan 5 of 30",
      "description": "What is the highest mountain in Japan?",
      "buttonsTexts": ["Fuji", "Tate", "Aso", "Ask Friend"],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [5, 5, 5, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Japan 6 of 30",
      "description": "Who became the head of state of Japan in January 1989?",
      "buttonsTexts": [
        "Emperor Akihito",
        "Naruhito",
        "Emperor Taishō",
        "Ask Friend"
      ],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [6, 6, 6, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Japan 7 of 30",
      "description": "How many times has Osaka hosted the World Exposition?",
      "buttonsTexts": ["2", "3", "4", "Ask Friend"],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [7, 7, 7, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Japan 8 of 30",
      "description":
          "Which Michael Douglas movie was filmed almost entirely in Osaka?",
      "buttonsTexts": [
        "Basic Instinct",
        "Black Rain",
        "Falling Down",
        "Ask Friend"
      ],
      "buttonAnswers": [0, 1, 0, 0],
      "answersCount": 1,
      "goIndexes": [8, 8, 8, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Japan 9 of 30",
      "description": "What is the capital and largest city of Japan?",
      "buttonsTexts": ["Osaka", "Tokyo", "Kyoto", "Ask Friend"],
      "buttonAnswers": [0, 1, 0, 0],
      "answersCount": 1,
      "goIndexes": [9, 9, 9, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Japan 10 of 30",
      "description":
          "Who is the largest and most profitable Japanese company and the second largest auto maker in the world?",
      "buttonsTexts": ["Toyota", "Honda", "Mazda", "Ask Friend"],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [10, 10, 10, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Japan 11 of 30",
      "description": "On what occasion would a man wear a white kimono?",
      "buttonsTexts": [
        "His own funeral",
        "Wedding",
        "Birthday party",
        "Ask Friend"
      ],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [11, 11, 11, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Japan 12 of 30",
      "description":
          "What is the legal age for the consumption of alcohol in Japan?",
      "buttonsTexts": ["20", "21", "18", "Ask Friend"],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [12, 12, 12, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Japan 13 of 30",
      "description": "Which side of the road do Japanese drive on?",
      "buttonsTexts": ["Left", "Right", "Both", "Ask Friend"],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [13, 13, 13, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Japan 14 of 30",
      "description": "What was the capital city of Japan until 1869?",
      "buttonsTexts": ["Osaka", "Tokyo", "Kyoto", "Ask Friend"],
      "buttonAnswers": [0, 0, 1, 0],
      "answersCount": 1,
      "goIndexes": [14, 14, 14, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Japan 15 of 30",
      "description":
          "The 1998 Olympic Winter Games were held in which area of Japan?",
      "buttonsTexts": ["Nagano", "Tokyo", "Osaka", "Ask Friend"],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [15, 15, 15, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Japan 16 of 30",
      "description": "Which religion is native to Japan?",
      "buttonsTexts": ["Shintoism", "Islam", "Taoism", "Ask Friend"],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [16, 16, 16, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Japan 17 of 30",
      "description": "What does 'domo arigato' mean?",
      "buttonsTexts": ["Thank you", "Hello", "Buy", "Ask Friend"],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [17, 17, 17, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Japan 18 of 30",
      "description": "What are the native people of Japan called?",
      "buttonsTexts": ["Ainu", "Japanese", "Ryukyuan", "Ask Friend"],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [18, 18, 18, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Japan 19 of 30",
      "description":
          "The Japanese call their country \"Nippon\" or \"Nihon\". What does this mean?",
      "buttonsTexts": ["Source of the sun", "Moon", "Kingdom", "Ask Friend"],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [19, 19, 19, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Japan 20 of 30",
      "description":
          "In which year did Japan seize the Chinese province of Manchuria?",
      "buttonsTexts": ["1931", "1930", "1932", "Ask Friend"],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [20, 20, 20, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Japan 21 of 30",
      "description": "What do Japanese people celebrate at a \"hanami\" party?",
      "buttonsTexts": [
        "Cherry blossom",
        "New Years Eve",
        "Christmas",
        "Ask Friend"
      ],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [21, 21, 21, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Japan 22 of 30",
      "description":
          "Which flower is a symbol of the Emperor and the Imperial family?",
      "buttonsTexts": ["Chrysanthemum", "Rose", "Sunflower", "Ask Friend"],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [22, 22, 22, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Japan 23 of 30",
      "description":
          "Which company's slogans have included \"be moved\", \"make believe\", and \"like no other\"?",
      "buttonsTexts": ["Toyota", "Sony", "Mazda", "Ask Friend"],
      "buttonAnswers": [0, 1, 0, 0],
      "answersCount": 1,
      "goIndexes": [23, 23, 23, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Japan 24 of 30",
      "description": "Name the longest river in Japan?",
      "buttonsTexts": [
        "Tone River",
        "Shinano River",
        "Ishikari River",
        "Ask Friend"
      ],
      "buttonAnswers": [0, 1, 0, 0],
      "answersCount": 1,
      "goIndexes": [24, 24, 24, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Japan 25 of 30",
      "description":
          "What name was given to the military dictators of Japan between 1185 to 1868?",
      "buttonsTexts": ["Kings", "Shoguns", "Tsars", "Ask Friend"],
      "buttonAnswers": [0, 1, 0, 0],
      "answersCount": 1,
      "goIndexes": [25, 25, 25, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Japan 26 of 30",
      "description": "Name the sea straight between Honshu and Hokkaido?",
      "buttonsTexts": ["Tsugaru Strait", "Cape Tappi", "Tsugaru", "Ask Friend"],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [26, 26, 26, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Japan 27 of 30",
      "description": "Name the world famous upscale shopping area in Tokyo...",
      "buttonsTexts": ["Ginza", "Kinza", "Brinza", "Ask Friend"],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [27, 27, 27, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Japan 28 of 30",
      "description":
          "Tokyo International Airport is commonly known by what name?",
      "buttonsTexts": [
        "Haneda Airport",
        "Tokyo Airport",
        "Nationa Airport",
        "Ask Friend"
      ],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [28, 28, 28, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Japan 29 of 30",
      "description":
          "Which former Imperial capital is an anagram of today's modern capital?",
      "buttonsTexts": ["Tokyo", "Kyoto", "Osaka", "Ask Friend"],
      "buttonAnswers": [0, 1, 0, 0],
      "answersCount": 1,
      "goIndexes": [29, 29, 29, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Japan 30 of 30",
      "description": "What is the name of Japan's national parliament?",
      "buttonsTexts": ["Diet", "Duma", "Kinza", "Ask Friend"],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [30, 30, 30, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Result",
      "description":
          "You got [correctAnswers] out of [totalQuestionsCount] questions correct.",
      "buttonsTexts": ["Start Over", "Share"],
      "buttonAnswers": [0, 0],
      "answersCount": 0,
      "goIndexes": [10003, 10001],
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
