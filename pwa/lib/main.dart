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
    },
    {
      "title": "Croatia 1 of 30",
      "description": "What is the capital of Croatia?",
      "buttonsTexts": ["Zagreb", "Split", "Novi Sad", "Ask Friend"],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [1, 1, 1, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Croatia 2 of 30",
      "description": "Which city isn't in Croatia?",
      "buttonsTexts": ["Zavidovici", "Porec", "Metkovic", "Ask Friend"],
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
      "title": "Croatia 3 of 30",
      "description": "First croatian king was...",
      "buttonsTexts": ["Vjekoslav", "Tomislav", "Miroslav", "Ask Friend"],
      "buttonAnswers": [0, 1, 0, 0],
      "answersCount": 1,
      "goIndexes": [3, 3, 3, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Croatia 4 of 30",
      "description": "Croatian people speak...",
      "buttonsTexts": ["Croatian", "Serbo-Croatian", "Bosnian", "Ask Friend"],
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
      "title": "Croatia 5 of 30",
      "description": "How many countries border Croatia?",
      "buttonsTexts": ["6", "5", "7", "Ask Friend"],
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
      "title": "Croatia 6 of 30",
      "description": "What is the biggest peninsula in Croatia?",
      "buttonsTexts": ["Istria", "Kostrena", "Pag", "Ask Friend"],
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
      "title": "Croatia 7 of 30",
      "description": "How many national parks Croatia has?",
      "buttonsTexts": ["8", "7", "6", "Ask Friend"],
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
      "title": "Croatia 8 of 30",
      "description": "What is the name of the Croatian dance?",
      "buttonsTexts": ["Kalinka", "Kolo", "Schuhplattler", "Ask Friend"],
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
      "title": "Croatia 9 of 30",
      "description": "Which of the following are Croatian national animals?",
      "buttonsTexts": ["Tiger", "Puma", "Marten Ferrett", "Ask Friend"],
      "buttonAnswers": [0, 1, 1, 0],
      "answersCount": 2,
      "goIndexes": [9, 9, 9, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Croatia 10 of 30",
      "description": "What is the native name for Croatia?",
      "buttonsTexts": ["Hrvatska", "Horvatia", "Kravatia", "Ask Friend"],
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
      "title": "Croatia 11 of 30",
      "description": "On which sea is Croatia located?",
      "buttonsTexts": ["Adriatic", "Black", "Caspian", "Ask Friend"],
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
      "title": "Croatia 12 of 30",
      "description": "Who was Croatia's first President after independence?",
      "buttonsTexts": [
        "Franjo Tudjman",
        "Stjepan Mesić",
        "Ivo Josipović",
        "Ask Friend"
      ],
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
      "title": "Croatia 13 of 30",
      "description": "What is the main religion of Croatia?",
      "buttonsTexts": [
        "Roman Catholic",
        "Protestant Catholics",
        "Greek Catholics",
        "Ask Friend"
      ],
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
      "title": "Croatia 14 of 30",
      "description": "Which Croatian city was formerly known as Ragusa?",
      "buttonsTexts": ["Split", "Dubrovnik", "Zagreb", "Ask Friend"],
      "buttonAnswers": [0, 1, 0, 0],
      "answersCount": 1,
      "goIndexes": [14, 14, 14, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Croatia 15 of 30",
      "description": "Croatia's northernmost island is what?",
      "buttonsTexts": ["Krk", "Punat", "Vrbnik", "Ask Friend"],
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
      "title": "Croatia 16 of 30",
      "description": "What is the official currency in Croatia?",
      "buttonsTexts": ["Kuna", "Euro", "Krona", "Ask Friend"],
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
      "title": "Croatia 17 of 30",
      "description":
          "Croatia had to get its freedom by war. When did that war begin?",
      "buttonsTexts": ["1991", "1990", "1992", "Ask Friend"],
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
      "title": "Croatia 18 of 30",
      "description": "Where in Europe is Croatia located?",
      "buttonsTexts": ["Southeast", "West", "Northeast", "Ask Friend"],
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
      "title": "Croatia 19 of 30",
      "description":
          "Who is normally credited with giving Dubrovnik the name \"the Pearl of the Adriatic\"?",
      "buttonsTexts": [
        "Robert Burns",
        "Lord Byron",
        "Walter Scott",
        "Ask Friend"
      ],
      "buttonAnswers": [0, 1, 0, 0],
      "answersCount": 1,
      "goIndexes": [19, 19, 19, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Croatia 20 of 30",
      "description":
          "Korkyra Melaina was the original name of which Croatian island?",
      "buttonsTexts": ["Korcula", "Krk", "Vrbnik", "Ask Friend"],
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
      "title": "Croatia 21 of 30",
      "description":
          "Located in the old town area of Split are the remains of the palace of which Roman emperor?",
      "buttonsTexts": [
        "Diocletian",
        "Commodus",
        "Marcus Aurelius",
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
      "title": "Croatia 22 of 30",
      "description":
          "Located in the northern part of Croatia, the city of Pula is situated on which peninsula?",
      "buttonsTexts": ["Pag", "Kostrena", "Istria", "Ask Friend"],
      "buttonAnswers": [0, 0, 1, 0],
      "answersCount": 1,
      "goIndexes": [22, 22, 22, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Croatia 23 of 30",
      "description": "What are the background colors of Croatia's flag?\n",
      "buttonsTexts": [
        "Red, green, blue",
        "Red, white, blue",
        "Red, white, green",
        "Ask Friend"
      ],
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
      "title": "Croatia 24 of 30",
      "description":
          "Which of these countries does Croatia not have a border with?",
      "buttonsTexts": ["Montenegro", "Serbia", "Austria", "Ask Friend"],
      "buttonAnswers": [0, 0, 1, 0],
      "answersCount": 1,
      "goIndexes": [24, 24, 24, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Croatia 25 of 30",
      "description": "What is the national flower of Croatia?",
      "buttonsTexts": ["Iris", "Rose", "Tulip", "Ask Friend"],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [25, 25, 25, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Croatia 26 of 30",
      "description":
          "Only one of these European countries is bigger than Croatia, but which one?",
      "buttonsTexts": ["Portugal", "Denmark", "Switzerland", "Ask Friend"],
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
      "title": "Croatia 27 of 30",
      "description":
          "Stone from which Croatian island helped build the White House in Washington? ",
      "buttonsTexts": ["Krk", "Brac", "Hvar", "Ask Friend"],
      "buttonAnswers": [0, 1, 0, 0],
      "answersCount": 1,
      "goIndexes": [27, 27, 27, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Croatia 28 of 30",
      "description":
          "Which Croatian coastal city is home to a Roman amphitheater from the 1st century? ",
      "buttonsTexts": ["Ontario", "British Columbia", "Quebec", "Ask Friend"],
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
      "title": "Croatia 29 of 30",
      "description": "How many provinces does Canada have?",
      "buttonsTexts": ["Split", "Pula", "Zadar", "Ask Friend"],
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
      "title": "Croatia 30 of 30",
      "description":
          "Croatia lost in the 2018 World Cup Final to France but what was the result?",
      "buttonsTexts": ["4-2", "3-2", "2-1", "Ask Friend"],
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
    },
    {
      "title": "Canada 1 of 30",
      "description": "Name the official languages of Canada...",
      "buttonsTexts": ["English", "French", "Spanish", "Ask Friend"],
      "buttonAnswers": [1, 1, 0, 0],
      "answersCount": 2,
      "goIndexes": [1, 1, 1, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Canada 2 of 30",
      "description": "What is the capital of Canada?",
      "buttonsTexts": ["Ottawa", "Toronto", "Montreal", "Ask Friend"],
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
      "title": "Canada 3 of 30",
      "description": "What city is furthest East?",
      "buttonsTexts": ["Calgary", "Sydney", "Regina", "Ask Friend"],
      "buttonAnswers": [0, 1, 0, 0],
      "answersCount": 1,
      "goIndexes": [3, 3, 3, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Canada 4 of 30",
      "description": "What 2 nations fought over control of Canada?",
      "buttonsTexts": [
        "Britain and France",
        "France and Spain",
        "USA and Britain",
        "Ask Friend"
      ],
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
      "title": "Canada 5 of 30",
      "description": "What is Canada's National Summer Sport?",
      "buttonsTexts": ["Lacrosse", "Cricket", "Soccer", "Ask Friend"],
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
      "title": "Canada 6 of 30",
      "description": "Where is Banff National Park?",
      "buttonsTexts": [
        "Alberta",
        "Nova Scotia",
        "British Columbia",
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
      "title": "Canada 7 of 30",
      "description": "When is Canada's Birthday?",
      "buttonsTexts": ["July 4th", "July 1st", "July 2st", "Ask Friend"],
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
      "title": "Canada 8 of 30",
      "description": "What is Canada's National Bird?",
      "buttonsTexts": [
        "The Canada Goose",
        "The Loon",
        "The Arctic Tern",
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
      "title": "Canada 9 of 30",
      "description": "What city was once known as Hochelaga?",
      "buttonsTexts": ["Calgary", "Montreal", "Toronto", "Ask Friend"],
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
      "title": "Canada 10 of 30",
      "description":
          "New territory that was created for the native Inuit who live there...",
      "buttonsTexts": ["Nunavut", "British Columbia", "Ontario", "Ask Friend"],
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
      "title": "Canada 11 of 30",
      "description": "Canada's most populous province is...",
      "buttonsTexts": ["Ontario", "British Columbia", "Quebec", "Ask Friend"],
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
      "title": "Canada 12 of 30",
      "description": "Canada's western most province is...",
      "buttonsTexts": ["British Columbia", "Nunavut", "Manitoba", "Ask Friend"],
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
      "title": "Canada 13 of 30",
      "description": "What did the French call their new land?",
      "buttonsTexts": ["New France", "Nova Scotia", "Paris", "Ask Friend"],
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
      "title": "Canada 14 of 30",
      "description":
          "What Mountain range found in the West and shared with the United States?",
      "buttonsTexts": [
        "Appalachian Mountains",
        "Rocky Mountains",
        "Ural Mountains",
        "Ask Friend"
      ],
      "buttonAnswers": [0, 1, 0, 0],
      "answersCount": 1,
      "goIndexes": [14, 14, 14, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Canada 15 of 30",
      "description": "What Great lake does not border Canada?",
      "buttonsTexts": [
        "Lake Michigan",
        "Lake Erie",
        "Lake Ontario",
        "Ask Friend"
      ],
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
      "title": "Canada 16 of 30",
      "description": "First people to inhabit Canada in 1000 A.D. were...",
      "buttonsTexts": ["Vikings", "Hindi", "Spanish", "Ask Friend"],
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
      "title": "Canada 17 of 30",
      "description": "What is the most common language spoken in Canada?",
      "buttonsTexts": ["English", "French", "Russian", "Ask Friend"],
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
      "title": "Canada 18 of 30",
      "description":
          "What mountain range is shared with the United States and Canada on the Eastern coast?",
      "buttonsTexts": [
        "Appalachian Mountains",
        "Coast Mountains",
        "Ural Mountains",
        "Ask Friend"
      ],
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
      "title": "Canada 19 of 30",
      "description": "Who leads the Central Government of Canada?",
      "buttonsTexts": ["Premier", "Prime Minister", "President", "Ask Friend"],
      "buttonAnswers": [0, 1, 0, 0],
      "answersCount": 1,
      "goIndexes": [19, 19, 19, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Canada 20 of 30",
      "description": "What connects the Great Lakes to the Atlantic Ocean?",
      "buttonsTexts": [
        "St. Lawrence River",
        "Saskatchwan River",
        "Hudson Bay",
        "Ask Friend"
      ],
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
      "title": "Canada 21 of 30",
      "description": "What is Canada's most urbanized province?",
      "buttonsTexts": ["Quebec", "Manitoba", "Alberta", "Ask Friend"],
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
      "title": "Canada 22 of 30",
      "description": "Provincial Governments are lead by whom in Canada?",
      "buttonsTexts": ["Premier", "Prime Minister", "President", "Ask Friend"],
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
      "title": "Canada 23 of 30",
      "description": "What is Canada's largest city?",
      "buttonsTexts": ["Toronto", "Calgary", "Montreal", "Ask Friend"],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [23, 23, 23, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Canada 24 of 30",
      "description":
          "Canada is a bilingual country, but what is the only officially bilingual province?",
      "buttonsTexts": ["Quebec", "New Brunswick", "Ontario", "Ask Friend"],
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
      "title": "Canada 25 of 30",
      "description": "Where does the word Canada come from?",
      "buttonsTexts": [
        "Samuel Champlain",
        "Jacque Cartier",
        "Jean Niccolet",
        "Ask Friend"
      ],
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
      "title": "Canada 26 of 30",
      "description": "What are the two most multicultural cities in Canada?",
      "buttonsTexts": [
        "Vancouver and Toronto",
        "Vancouver and Montreal",
        "Toronto and Montreal",
        "Ask Friend"
      ],
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
      "title": "Canada 27 of 30",
      "description": "What is Canada's National Sport?",
      "buttonsTexts": [
        "Both Hockey and Lacrosse",
        "Hockey",
        "Lacrosse",
        "Ask Friend"
      ],
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
      "title": "Canada 28 of 30",
      "description": "Toronto is the capital of...",
      "buttonsTexts": ["Ontario", "British Columbia", "Quebec", "Ask Friend"],
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
      "title": "Canada 29 of 30",
      "description": "How many provinces does Canada have?",
      "buttonsTexts": ["8", "10", "5", "Ask Friend"],
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
      "title": "Canada 30 of 30",
      "description": "Victoria is the capital of...",
      "buttonsTexts": ["British Columbia", "Ontario", "Quebec", "Ask Friend"],
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
    },
    {
      "title": "Italy 1 of 30",
      "description":
          "Which Italian car manufacturer sponsors a Formula One team?",
      "buttonsTexts": ["Ferrari", "Lamborgini", "Fiat", "Ask Friend"],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [1, 1, 1, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Italy 2 of 30",
      "description": "What is the capital of Italy?",
      "buttonsTexts": ["Milan", "Rome", "Palermo", "Ask Friend"],
      "buttonAnswers": [0, 1, 0, 0],
      "answersCount": 1,
      "goIndexes": [2, 2, 2, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Italy 3 of 30",
      "description": "What is the name of the church in the Vatican?",
      "buttonsTexts": ["St Peters", "St Pauls", "St Johns", "Ask Friend"],
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
      "title": "Italy 4 of 30",
      "description": "Who wrote the opera \"La Boheme\"?",
      "buttonsTexts": ["Paganini", "Puccini", "Verdi", "Ask Friend"],
      "buttonAnswers": [0, 1, 0, 0],
      "answersCount": 1,
      "goIndexes": [4, 4, 4, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Italy 5 of 30",
      "description": "What is the official name of Italy?",
      "buttonsTexts": [
        "Italian Republic",
        "Republic of Italy",
        "Italia",
        "Ask Friend"
      ],
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
      "title": "Italy 6 of 30",
      "description": "Which mountain forms the backbone of this peninsula?",
      "buttonsTexts": [
        "Apennine mountains",
        "Southern Limestone Alps",
        "Western Alps",
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
      "title": "Italy 7 of 30",
      "description": "In which region of Italy is Soave produced?",
      "buttonsTexts": ["Veneto", "Trentino", "Puglia", "Ask Friend"],
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
      "title": "Italy 8 of 30",
      "description": "The longest river in Italy is...",
      "buttonsTexts": ["Adige", "Po", "Adda", "Ask Friend"],
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
      "title": "Italy 9 of 30",
      "description": "How to say \"Good morning\" in Italian?    ",
      "buttonsTexts": ["Bonjour", "Buon giorno", "Goedemorgen", "Ask Friend"],
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
      "title": "Italy 10 of 30",
      "description": "How many cities are there in Italy?",
      "buttonsTexts": ["144", "199", "122", "Ask Friend"],
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
      "title": "Italy 11 of 30",
      "description": "The largest island of Italy is...",
      "buttonsTexts": ["Sicily", "Sardinia", "Elba", "Ask Friend"],
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
      "title": "Italy 12 of 30",
      "description": "Italy won the FIFA World Cup in...",
      "buttonsTexts": ["2006", "1986", "2010", "Ask Friend"],
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
      "title": "Italy 13 of 30",
      "description": "Where is the leaning tower?",
      "buttonsTexts": ["Pisa", "Venice", "Genoa", "Ask Friend"],
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
      "title": "Italy 14 of 30",
      "description": "Name an Italian tenor...",
      "buttonsTexts": [
        "Marco Ruffo",
        "Andrea Bocelli",
        "Enrique Iglesias",
        "Ask Friend"
      ],
      "buttonAnswers": [0, 1, 0, 0],
      "answersCount": 1,
      "goIndexes": [14, 14, 14, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Italy 15 of 30",
      "description": "Name an Italian fashion model...",
      "buttonsTexts": [
        "Sarah Silverman",
        "Gabriel Garko",
        "Cindy Crawford",
        "Ask Friend"
      ],
      "buttonAnswers": [0, 1, 0, 0],
      "answersCount": 1,
      "goIndexes": [15, 15, 15, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Italy 16 of 30",
      "description": "Who was the last of Rome's \"Five Good Emperors\"?",
      "buttonsTexts": ["Marcus Aurelius", "Caligula", "Nero", "Ask Friend"],
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
      "title": "Italy 17 of 30",
      "description": "Name a tourist attraction that represents Italy...",
      "buttonsTexts": ["Colosseum", "Pyramids", "Le Louvre", "Ask Friend"],
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
      "title": "Italy 18 of 30",
      "description": "What does a gift of yellow flowers suggest in Italy?",
      "buttonsTexts": ["Jealousy", "Bad Luck", "Love", "Ask Friend"],
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
      "title": "Italy 19 of 30",
      "description": "Who is originally from Italy?",
      "buttonsTexts": [
        "Dan Brown",
        "Valerio Evangelisti",
        "Stephen King",
        "Ask Friend"
      ],
      "buttonAnswers": [0, 1, 0, 0],
      "answersCount": 1,
      "goIndexes": [19, 19, 19, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Italy 20 of 30",
      "description": "Who was the first emperor of Rome?",
      "buttonsTexts": ["Octavian", "Julius Caesar", "Cassius", "Ask Friend"],
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
      "title": "Italy 21 of 30",
      "description": "How did Romans call the Colosseum?",
      "buttonsTexts": [
        "Flavian Amphitheatre",
        "Circus Maximus",
        "Caesarian Colosseum",
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
      "title": "Italy 22 of 30",
      "description":
          "Emperor Constantine helped build Christian churches in all the following locations except which?",
      "buttonsTexts": ["Alexandria", "Jerusalem", "Rome", "Ask Friend"],
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
      "title": "Italy 23 of 30",
      "description": "What is the name of a famous Italian astronaut?",
      "buttonsTexts": [
        "Paolo Boi",
        "Roberto Vittori",
        "Alessandro Salvio",
        "Ask Friend"
      ],
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
      "title": "Italy 24 of 30",
      "description": "Who was a famous Italian cartoonist?",
      "buttonsTexts": ["Victor Hugo", "Hugo Pratt", "Mario Bava", "Ask Friend"],
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
      "title": "Italy 25 of 30",
      "description":
          "What Italian explorer discovered the Mississippi Valley in America?",
      "buttonsTexts": [
        "James Madsen",
        "Henri De Tonti",
        "Marco Polo",
        "Ask Friend"
      ],
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
      "title": "Italy 26 of 30",
      "description":
          "Under Julius Caesar's rule, what did fathers of three or more children receive?",
      "buttonsTexts": ["Land", "Housing", "Horse", "Ask Friend"],
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
      "title": "Italy 27 of 30",
      "description": "Who did Emperor Nero blame for the burning of Rome?",
      "buttonsTexts": ["Christians", "Persians", "Greeks", "Ask Friend"],
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
      "title": "Italy 28 of 30",
      "description":
          "What is the last name of the Italian family who came to America and fashioned whirlpools?",
      "buttonsTexts": ["Jacuzzi", "Toti", "Ponza", "Ask Friend"],
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
      "title": "Italy 29 of 30",
      "description":
          "In what year did Mussolini's dictatorship in Italy collapse?",
      "buttonsTexts": ["1944", "1943", "1945", "Ask Friend"],
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
      "title": "Italy 30 of 30",
      "description":
          "What country's flag is identical to Italy's except in the last stripe being orange rather than red?",
      "buttonsTexts": ["Ireland", "France", "Monaco", "Ask Friend"],
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
    },
    {
      "title": "Israel 1 of 30",
      "description": "Who never visited Israel? ",
      "buttonsTexts": ["Moses", "Jesus", "Mohammed", "Ask Friend"],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [1, 1, 1, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Israel 2 of 30",
      "description":
          "The Dead Sea is the lowest place on earth, the deepest point is...",
      "buttonsTexts": ["300 meters", "1000 meters", "800 meters", "Ask Friend"],
      "buttonAnswers": [0, 0, 1, 0],
      "answersCount": 1,
      "goIndexes": [2, 2, 2, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Israel 3 of 30",
      "description": "What is the capital city of Israel?",
      "buttonsTexts": ["Haifa", "Tel Aviv", "Jerusalem", "Ask Friend"],
      "buttonAnswers": [0, 0, 1, 0],
      "answersCount": 1,
      "goIndexes": [3, 3, 3, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Israel 4 of 30",
      "description": "The Israeli currency is...",
      "buttonsTexts": ["Shekel", "Dinar", "Bitcoin", "Ask Friend"],
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
      "title": "Israel 5 of 30",
      "description": "During the Jewish holiday Passover, you can't eat...",
      "buttonsTexts": ["Chocolate", "Bread", "Pork", "Ask Friend"],
      "buttonAnswers": [0, 1, 0, 0],
      "answersCount": 1,
      "goIndexes": [5, 5, 5, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Israel 6 of 30",
      "description": "Who is originally from Israel?",
      "buttonsTexts": ["Natalie Portman", "Moran Atias", "Both", "Ask Friend"],
      "buttonAnswers": [0, 0, 1, 0],
      "answersCount": 1,
      "goIndexes": [6, 6, 6, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Israel 7 of 30",
      "description": "Jerusalem population is...",
      "buttonsTexts": ["800,000", "9,000,000", "5,000,000", "Ask Friend"],
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
      "title": "Israel 8 of 30",
      "description": "What are Miriam Lite, Guttman Kav and Narkis?",
      "buttonsTexts": ["Beer", "Hebrew Fonts", "Shopping Malls", "Ask Friend"],
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
      "title": "Israel 9 of 30",
      "description":
          "Who was the first person to win the Israeli Prize for Arabic literature?",
      "buttonsTexts": [
        "Anton Shammas",
        "Emile Habibi",
        "Batya Gur",
        "Ask Friend"
      ],
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
      "title": "Israel 10 of 30",
      "description":
          "How many UNESCO World Heritage Sites are there in Israel?",
      "buttonsTexts": ["8", "10", "4", "Ask Friend"],
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
      "title": "Israel 11 of 30",
      "description": "Who is the only person to be executed by Israel?",
      "buttonsTexts": [
        "Rudolf Hess",
        "Reinhard Heydrich",
        "Adolf Eichmann",
        "Ask Friend"
      ],
      "buttonAnswers": [0, 0, 1, 0],
      "answersCount": 1,
      "goIndexes": [11, 11, 11, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Israel 12 of 30",
      "description":
          "Where is the only kosher McDonald's restaurant outside Israel?",
      "buttonsTexts": ["New York", "Buenos Aires", "Paris", "Ask Friend"],
      "buttonAnswers": [0, 1, 0, 0],
      "answersCount": 1,
      "goIndexes": [12, 12, 12, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Israel 13 of 30",
      "description":
          "When did the first commercial television station start broadcasting in Israel?",
      "buttonsTexts": ["1993", "2003", "1983", "Ask Friend"],
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
      "title": "Israel 14 of 30",
      "description":
          "How many women signed Israel's Declaration of Independence?",
      "buttonsTexts": ["3", "2", "1", "Ask Friend"],
      "buttonAnswers": [0, 1, 0, 0],
      "answersCount": 1,
      "goIndexes": [14, 14, 14, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Israel 15 of 30",
      "description":
          "In what year was the Israeli settlement of Yamit evacuated?",
      "buttonsTexts": ["1983", "1981", "1982", "Ask Friend"],
      "buttonAnswers": [0, 0, 1, 0],
      "answersCount": 1,
      "goIndexes": [15, 15, 15, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Israel 16 of 30",
      "description": "What is the main ingredient in sabich?",
      "buttonsTexts": ["Eggplant", "Pork", "Onions", "Ask Friend"],
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
      "title": "Israel 17 of 30",
      "description":
          "Which Israeli soccer coach was manager of Chelsea in 2007-2009?",
      "buttonsTexts": [
        "Dror Kashtan",
        "Eli Guttman",
        "Avram Grant",
        "Ask Friend"
      ],
      "buttonAnswers": [0, 0, 1, 0],
      "answersCount": 1,
      "goIndexes": [17, 17, 17, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Israel 18 of 30",
      "description": "How many nature reserves are there in Israel?",
      "buttonsTexts": ["180", "190", "200", "Ask Friend"],
      "buttonAnswers": [0, 1, 0, 0],
      "answersCount": 1,
      "goIndexes": [18, 18, 18, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Israel 19 of 30",
      "description":
          "For what crime did former cabinet minister Gonen Segev receive a five-year prison sentence?",
      "buttonsTexts": ["Drug smuggling", "Bribery", "Rape", "Ask Friend"],
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
      "title": "Israel 20 of 30",
      "description": "What was Shimon Peres' first government role?",
      "buttonsTexts": [
        "Prime minister",
        "President",
        "Transport minister",
        "Ask Friend"
      ],
      "buttonAnswers": [0, 0, 1, 0],
      "answersCount": 1,
      "goIndexes": [20, 20, 20, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Israel 21 of 30",
      "description":
          "Which Israeli architect designed the Dynamic Tower in Dubai?",
      "buttonsTexts": [
        "Moshe Safdie",
        "David Fisher",
        "Eyal Weizman",
        "Ask Friend"
      ],
      "buttonAnswers": [0, 1, 0, 0],
      "answersCount": 1,
      "goIndexes": [21, 21, 21, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Israel 22 of 30",
      "description": "Which soccer team plays at the Doha Stadium?",
      "buttonsTexts": [
        "Bnei Sakhnin",
        "Hapoel Afula",
        "F.C. Kafr Qasim",
        "Ask Friend"
      ],
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
      "title": "Israel 23 of 30",
      "description": "Which is the most successful Israeli basketball team?",
      "buttonsTexts": [
        "Maccabi Tel Aviv",
        "Hapoel Jerusalem",
        "Ironi Nahariya",
        "Ask Friend"
      ],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [23, 23, 23, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Israel 24 of 30",
      "description": "Who founded the \"Voice of Peace\" pirate radio station?",
      "buttonsTexts": [
        "Hedy Epstein",
        "Peace Pilgrim",
        "Abie Nathan",
        "Ask Friend"
      ],
      "buttonAnswers": [0, 0, 1, 0],
      "answersCount": 1,
      "goIndexes": [24, 24, 24, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Israel 25 of 30",
      "description": "What is the national bird of Israel?",
      "buttonsTexts": ["Hoopoe", "Eagle", "Parrot", "Ask Friend"],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [25, 25, 25, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Israel 26 of 30",
      "description": "Who was the first Israeli in space?",
      "buttonsTexts": [
        "Ilan Ramon",
        "Rick Husband",
        "Kalpana Chawla",
        "Ask Friend"
      ],
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
      "title": "Israel 27 of 30",
      "description": "What is the country code for Israel?",
      "buttonsTexts": ["7", "971", "972", "Ask Friend"],
      "buttonAnswers": [0, 0, 1, 0],
      "answersCount": 1,
      "goIndexes": [27, 27, 27, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Israel 28 of 30",
      "description": "For what area of the arts is the Ophir Prize awarded?",
      "buttonsTexts": ["Film", "Music", "Science", "Ask Friend"],
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
      "title": "Israel 29 of 30",
      "description": "Israel's third-largest city is...",
      "buttonsTexts": ["Haifa", "Tel Aviv", "Jerusalem", "Ask Friend"],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [29, 29, 29, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Israel 30 of 30",
      "description": "Who was the first Israeli to be awarded a Nobel Prize?",
      "buttonsTexts": [
        "Shmuel Yosef Agnon",
        "Yosef Haim Brenner",
        "Berl Katznelson",
        "Ask Friend"
      ],
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
    },
    {
      "title": "Netherlands 1 of 30",
      "description":
          "Dutch is one of the closest relatives of which of these countries?",
      "buttonsTexts": [
        "German and French",
        "English and German",
        "French and English",
        "Ask Friend"
      ],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [1, 1, 1, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Netherlands 2 of 30",
      "description": "What is the capital of Netherlands?",
      "buttonsTexts": ["Utrecht", "Rotterdam", "Amsterdam", "Ask Friend"],
      "buttonAnswers": [0, 0, 1, 0],
      "answersCount": 1,
      "goIndexes": [2, 2, 2, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Netherlands 3 of 30",
      "description": "Which two countries surround Netherlands?",
      "buttonsTexts": [
        "Belgium and Germany",
        "Italy and Greece",
        "Germany and Spain",
        "Ask Friend"
      ],
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
      "title": "Netherlands 4 of 30",
      "description": "How many provinces are there in the Netherlands?",
      "buttonsTexts": ["11", "12", "13", "Ask Friend"],
      "buttonAnswers": [0, 1, 0, 0],
      "answersCount": 1,
      "goIndexes": [4, 4, 4, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Netherlands 5 of 30",
      "description": "What is the main language in the Netherlands?",
      "buttonsTexts": ["Dutch", "English", "German", "Ask Friend"],
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
      "title": "Netherlands 6 of 30",
      "description": "What is the main religion in the Netherlands? ",
      "buttonsTexts": ["Roman Catholic", "Islam", "Sikhism", "Ask Friend"],
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
      "title": "Netherlands 7 of 30",
      "description":
          "Which Canadian province do most Dutch immigrants move to?",
      "buttonsTexts": ["Ontario", "Nova Scotia", "Alberta", "Ask Friend"],
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
      "title": "Netherlands 8 of 30",
      "description":
          "The Royal Palace in the centre of Amsterdam is located on what big square?",
      "buttonsTexts": ["Bum", "Dum", "Sum", "Ask Friend"],
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
      "title": "Netherlands 9 of 30",
      "description": "Who was the Mayor of Amsterdam in 2001?",
      "buttonsTexts": [
        "Eberhard van der Laan",
        "Job Cohen",
        "Floris Cohen",
        "Ask Friend"
      ],
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
      "title": "Netherlands 10 of 30",
      "description": "Name the most famous soccer club in Amsterdam...",
      "buttonsTexts": ["Ajax", "Feyenoord", "PSV Eindhoven", "Ask Friend"],
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
      "title": "Netherlands 11 of 30",
      "description": "What is the capital of Noord Holland?",
      "buttonsTexts": ["Haarlem", "Amsterdam", "Rotterdam", "Ask Friend"],
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
      "title": "Netherlands 12 of 30",
      "description": "What is the capital of Zuid Holland?",
      "buttonsTexts": ["Haarlem", "Amsterdam", "Den Haag", "Ask Friend"],
      "buttonAnswers": [0, 0, 1, 0],
      "answersCount": 1,
      "goIndexes": [12, 12, 12, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Netherlands 13 of 30",
      "description": "What is the capital of Bonaire?",
      "buttonsTexts": ["Kralendijk", "Oranjestad", "Den Haag", "Ask Friend"],
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
      "title": "Netherlands 14 of 30",
      "description": "What is the capital of Aruba?",
      "buttonsTexts": ["Haarlem", "Oranjestad", "Den Haag", "Ask Friend"],
      "buttonAnswers": [0, 1, 0, 0],
      "answersCount": 1,
      "goIndexes": [14, 14, 14, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Netherlands 15 of 30",
      "description": "What is Amsterdam's Yiddish nickname?",
      "buttonsTexts": ["Bokum", "Mokum", "Vokum", "Ask Friend"],
      "buttonAnswers": [0, 1, 0, 0],
      "answersCount": 1,
      "goIndexes": [15, 15, 15, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Netherlands 16 of 30",
      "description": "Where can you find the famous Red Light District?",
      "buttonsTexts": ["Amsterdam", "Haarlem", "Rotterdam", "Ask Friend"],
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
      "title": "Netherlands 17 of 30",
      "description":
          "Which daughter of Queen Juliana became queen of The Netherlands?",
      "buttonsTexts": ["Beatrix", "Juliana", "Margriet", "Ask Friend"],
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
      "title": "Netherlands 18 of 30",
      "description": "Which brand of beer is Dutch?",
      "buttonsTexts": ["Heineken", "Lagunitas", "Pilsner", "Ask Friend"],
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
      "title": "Netherlands 19 of 30",
      "description": "What type of government does the Netherlands have?",
      "buttonsTexts": [
        "Republic",
        "Constitutional monarchy",
        "Federation",
        "Ask Friend"
      ],
      "buttonAnswers": [0, 1, 0, 0],
      "answersCount": 1,
      "goIndexes": [19, 19, 19, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Netherlands 20 of 30",
      "description": "What is the Dutch city of light?",
      "buttonsTexts": ["Eindhoven", "Rotterdam", "Utrecht", "Ask Friend"],
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
      "title": "Netherlands 21 of 30",
      "description":
          "What is the name of the range of islands north of the Dutch mainland?",
      "buttonsTexts": ["Wadden Eilanden", "Borkum", "Sylt", "Ask Friend"],
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
      "title": "Netherlands 22 of 30",
      "description": "How many canals does the Utrechtsestraat cross?",
      "buttonsTexts": ["3", "2", "4", "Ask Friend"],
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
      "title": "Netherlands 23 of 30",
      "description": "Which river runs parallel to the Utrechtsestraat?",
      "buttonsTexts": [
        "Keizersgracht",
        "Amstel",
        "Reguliersgracht",
        "Ask Friend"
      ],
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
      "title": "Netherlands 24 of 30",
      "description":
          "On which day is the weekly flower market of the Amstelveld?",
      "buttonsTexts": ["Sunday", "Monday", "Tuesday", "Ask Friend"],
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
      "title": "Netherlands 25 of 30",
      "description": "What is the main city of the region Het Gooi?",
      "buttonsTexts": ["Hilversum", "Utrecht", "Oranjestad", "Ask Friend"],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [25, 25, 25, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Netherlands 26 of 30",
      "description":
          "What is the alternative name of Amsterdam International Airport?",
      "buttonsTexts": ["Schiphol", "Giphol", "Amstel", "Ask Friend"],
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
      "title": "Netherlands 27 of 30",
      "description":
          "What is the name of the town half way between The Hague and Rotterdam?",
      "buttonsTexts": ["Delft", "Rotterdam", "Utrecht", "Ask Friend"],
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
      "title": "Netherlands 28 of 30",
      "description":
          "What is the alternative name of Rotterdam International Airport?",
      "buttonsTexts": ["Zestienhoven", "Eindhoven", "Hoven", "Ask Friend"],
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
      "title": "Netherlands 29 of 30",
      "description": "What is the official name of the Rotterdam zoo?",
      "buttonsTexts": [
        "Keukenhof",
        "Diergaarde Blijdorp",
        "Stedelijk",
        "Ask Friend"
      ],
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
      "title": "Netherlands 30 of 30",
      "description": "When did the first settlers settle in Amsterdam?",
      "buttonsTexts": ["1126", "1125", "1225", "Ask Friend"],
      "buttonAnswers": [0, 1, 0, 0],
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
    },
    {
      "title": "Finland 1 of 30",
      "description": "What is the Swedish name for Helsinki?",
      "buttonsTexts": ["Helsinborg", "Helsingfors", "Helsinkus", "Ask Friend"],
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
      "title": "Finland 2 of 30",
      "description": "When was Helsinki founded?",
      "buttonsTexts": ["1550", "1555", "1545", "Ask Friend"],
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
      "title": "Finland 3 of 30",
      "description": "In what year the Olympic Games were held in Helsinki?",
      "buttonsTexts": ["1952", "1992", "1932", "Ask Friend"],
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
      "title": "Finland 4 of 30",
      "description": "What is the highest point of Finland?",
      "buttonsTexts": ["Saana", "Halti", "Kovddoskaisi", "Ask Friend"],
      "buttonAnswers": [0, 1, 0, 0],
      "answersCount": 1,
      "goIndexes": [4, 4, 4, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Finland 5 of 30",
      "description": "What is the largest lake in Finland?",
      "buttonsTexts": ["Saimaa", "Ladoga", "Onega", "Ask Friend"],
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
      "title": "Finland 6 of 30",
      "description": "What is the biggest city in Finland?",
      "buttonsTexts": ["Helsinki", "Turku", "Oulu", "Ask Friend"],
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
      "title": "Finland 7 of 30",
      "description": "When did Finland gain its independence?",
      "buttonsTexts": ["1917", "1929", "1918", "Ask Friend"],
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
      "title": "Finland 8 of 30",
      "description": "What is the oldest city in Finland?",
      "buttonsTexts": ["Helsinki", "Turku", "Oulu", "Ask Friend"],
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
      "title": "Finland 9 of 30",
      "description": "Who was elected President of Finland in 2000?",
      "buttonsTexts": [
        "Pentti Arajärvi",
        "Tarja Halonen",
        "Tellervo Koivisto",
        "Ask Friend"
      ],
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
      "title": "Finland 10 of 30",
      "description": "What is considered to be Finland's national instrument?",
      "buttonsTexts": ["Kantele", "Guitar", "Balalaika", "Ask Friend"],
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
      "title": "Finland 11 of 30",
      "description":
          "From the 12th to the 19th centuries, Finland belonged to a different country. Which country was it?",
      "buttonsTexts": ["Russia", "Sweden", "Norway", "Ask Friend"],
      "buttonAnswers": [0, 1, 0, 0],
      "answersCount": 1,
      "goIndexes": [11, 11, 11, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Finland 12 of 30",
      "description": "What day is the Finnish Independence Day?",
      "buttonsTexts": ["December 6", "December 5", "December 4", "Ask Friend"],
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
      "title": "Finland 13 of 30",
      "description":
          "When translated into English, what is the title of the Finnish national anthem?",
      "buttonsTexts": ["Our Land", "Our Glory", "Our Country", "Ask Friend"],
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
      "title": "Finland 14 of 30",
      "description":
          "From which country did Finland gain its independence in 1917?",
      "buttonsTexts": ["Russia", "Sweden", "Norway", "Ask Friend"],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [14, 14, 14, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Finland 15 of 30",
      "description":
          "Finland has two official languages. One is Finnish, what is the other one?",
      "buttonsTexts": ["Russian", "Swedish", "English", "Ask Friend"],
      "buttonAnswers": [0, 1, 0, 0],
      "answersCount": 1,
      "goIndexes": [15, 15, 15, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Finland 16 of 30",
      "description": "What is the currency of Finland?",
      "buttonsTexts": ["Euro", "Franc", "Krona", "Ask Friend"],
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
      "title": "Finland 17 of 30",
      "description":
          "In 1939-40 Finland fought the Winter War against which country?",
      "buttonsTexts": ["USSR", "Germany", "Sweden", "Ask Friend"],
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
      "title": "Finland 18 of 30",
      "description": "What was the capital of Finland before Helsinki?",
      "buttonsTexts": ["Oulu", "Turku", "Tampere", "Ask Friend"],
      "buttonAnswers": [0, 1, 0, 0],
      "answersCount": 1,
      "goIndexes": [18, 18, 18, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Finland 19 of 30",
      "description":
          "What is the name of the Finnish national anthem, in Finnish?",
      "buttonsTexts": ["Maamme", "Mitä kuuluu", "Hieno", "Ask Friend"],
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
      "title": "Finland 20 of 30",
      "description": "Which animal appears on the Finnish coat of arms?",
      "buttonsTexts": ["Eagle", "Tiger", "Lion", "Ask Friend"],
      "buttonAnswers": [0, 0, 1, 0],
      "answersCount": 1,
      "goIndexes": [20, 20, 20, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Finland 21 of 30",
      "description": "What is the largest National Park in Finland?",
      "buttonsTexts": ["Lemmenjoki", "Tankavaara", "Sokosti", "Ask Friend"],
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
      "title": "Finland 22 of 30",
      "description": "What is the national animal of Finland?",
      "buttonsTexts": ["Brown Bear", "Lion", "White Bear", "Ask Friend"],
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
      "title": "Finland 23 of 30",
      "description":
          "With which country does Finland share its longest land border?",
      "buttonsTexts": ["Russia", "Sweden", "Norway", "Ask Friend"],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [23, 23, 23, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "Finland 24 of 30",
      "description":
          "Name a holiday in Finland, which is celebrated on May the 1st.",
      "buttonsTexts": ["Epiphany", "Vappu", "Pentecost", "Ask Friend"],
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
      "title": "Finland 25 of 30",
      "description": "What is the Finnish main population called in Finnish?",
      "buttonsTexts": ["Suomi", "Suomalaiset", "Suomala", "Ask Friend"],
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
      "title": "Finland 26 of 30",
      "description":
          "Which country lies immediately south of Finland's capital, Helsinki, across the Gulf of Finland?",
      "buttonsTexts": ["Estonia", "Russia", "Poland", "Ask Friend"],
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
      "title": "Finland 27 of 30",
      "description": "What is the most common type of rock in Finland?",
      "buttonsTexts": ["Granite", "Igneous", "Sedimentary", "Ask Friend"],
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
      "title": "Finland 28 of 30",
      "description": "When was Finland incorporated into the Russian empire?",
      "buttonsTexts": ["1809", "1908", "1798", "Ask Friend"],
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
      "title": "Finland 29 of 30",
      "description": "How many are the cultural areas in Finland?",
      "buttonsTexts": ["4", "3", "2", "Ask Friend"],
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
      "title": "Finland 30 of 30",
      "description": "In what year did the civil war occur in Finland?",
      "buttonsTexts": ["1918", "1917", "1920", "Ask Friend"],
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
    },
    {
      "title": "South Korea 1 of 30",
      "description": "What is the most popular sport in Korea?",
      "buttonsTexts": ["Judo", "Taekwondo", "Aikido", "Ask Friend"],
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
      "title": "South Korea 2 of 30",
      "description": "What is the name of the traditional Korean costume?",
      "buttonsTexts": ["Hanbok", "Banbok", "Yanbok", "Ask Friend"],
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
      "title": "South Korea 3 of 30",
      "description": "What is the largest island in Korea?",
      "buttonsTexts": ["Cheju", "Geojedo", "Jindo", "Ask Friend"],
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
      "title": "South Korea 4 of 30",
      "description": "What is the capital of South Korea?",
      "buttonsTexts": ["Pyongyang", "Seoul", "Phnom Penh", "Ask Friend"],
      "buttonAnswers": [0, 1, 0, 0],
      "answersCount": 1,
      "goIndexes": [4, 4, 4, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "South Korea 5 of 30",
      "description": "What is a jimjilbang?",
      "buttonsTexts": [
        "A bath house",
        "A purification ceremony",
        "Hostel",
        "Ask Friend"
      ],
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
      "title": "South Korea 6 of 30",
      "description": "What is the second most populous city in South Korea?",
      "buttonsTexts": ["Busan", "Seoul", "Incheon", "Ask Friend"],
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
      "title": "South Korea 7 of 30",
      "description":
          "What is the traditional dish made of rice topped with vegetables and a spicy sauce called?",
      "buttonsTexts": ["Bibimbap", "Bibi", "Pili-pili", "Ask Friend"],
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
      "title": "South Korea 8 of 30",
      "description": "What are the Boseong tea plantations known for?",
      "buttonsTexts": ["Black tea", "Green tea", "White tea", "Ask Friend"],
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
      "title": "South Korea 9 of 30",
      "description":
          "The song \"Gangnam Style\" by South Korea musician Psy refers to what?",
      "buttonsTexts": [
        "Korean sport",
        "Seoul district",
        "Korean dance",
        "Ask Friend"
      ],
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
      "title": "South Korea 10 of 30",
      "description": "How many times will Koreans brush their teeth per day?",
      "buttonsTexts": ["5", "2", "3", "Ask Friend"],
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
      "title": "South Korea 11 of 30",
      "description": "What is Soju?",
      "buttonsTexts": ["Tea", "An alcoholic beverage", "Soup", "Ask Friend"],
      "buttonAnswers": [0, 1, 0, 0],
      "answersCount": 1,
      "goIndexes": [11, 11, 11, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "South Korea 12 of 30",
      "description": "What percentage of Korea is mountainous?",
      "buttonsTexts": ["70", "50", "40", "Ask Friend"],
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
      "title": "South Korea 13 of 30",
      "description":
          "What is the name of the spicy cabbage side dish that accompanies most Korean meals?",
      "buttonsTexts": ["Kimchi", "Bibimbap", "Bulgogi", "Ask Friend"],
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
      "title": "South Korea 14 of 30",
      "description":
          "Who scored the \"Golden Goal\" header in the Round of 16 of the 2002 World Cup to send the Italians home?",
      "buttonsTexts": [
        "Ahn Jung Hwan",
        "Park Ji-sung",
        "Lee Chun-soo",
        "Ask Friend"
      ],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [14, 14, 14, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "South Korea 15 of 30",
      "description": "What is the most popular Korean surname?",
      "buttonsTexts": ["Hwan", "Kim", "Hong", "Ask Friend"],
      "buttonAnswers": [0, 1, 0, 0],
      "answersCount": 1,
      "goIndexes": [15, 15, 15, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "South Korea 16 of 30",
      "description": "Which Korean city hosted the Asian Games in 2002?",
      "buttonsTexts": ["Busan", "Seoul", "Daegu", "Ask Friend"],
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
      "title": "South Korea 17 of 30",
      "description": "Who was the mythical founder of Korea?",
      "buttonsTexts": ["Dangun", "Hwanung", "Jizi", "Ask Friend"],
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
      "title": "South Korea 18 of 30",
      "description":
          "What is the Korean word for the South Korean national flag?",
      "buttonsTexts": ["Annyeong", "Taegukgi", "Mwoya", "Ask Friend"],
      "buttonAnswers": [0, 1, 0, 0],
      "answersCount": 1,
      "goIndexes": [18, 18, 18, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "South Korea 19 of 30",
      "description": "Which of these was not one of Seoul's previous names?",
      "buttonsTexts": ["Hangang", "Hanseong", "Hanyang", "Ask Friend"],
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
      "title": "South Korea 20 of 30",
      "description":
          "What is the name of the Chinese characters that were used to write Korean?",
      "buttonsTexts": ["Hanzi", "Hangul", "Hanja", "Ask Friend"],
      "buttonAnswers": [0, 0, 1, 0],
      "answersCount": 1,
      "goIndexes": [20, 20, 20, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "South Korea 21 of 30",
      "description":
          "Which one of these is not a name of a Joseon social class?",
      "buttonsTexts": ["Nobi", "Chungin", "Yangban", "Ask Friend"],
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
      "title": "South Korea 22 of 30",
      "description": "The upper short jacket of a woman's hanbok is called...",
      "buttonsTexts": ["Jeogori", "Chima", "Yangban", "Ask Friend"],
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
      "title": "South Korea 23 of 30",
      "description": "Which South Korean city is the largest by area?",
      "buttonsTexts": ["Andong", "Busan", "Seoul", "Ask Friend"],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [23, 23, 23, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "South Korea 24 of 30",
      "description": "What is the name of North Korea's beer brand?",
      "buttonsTexts": ["Taedong", "Taedonggang", "Baltika", "Ask Friend"],
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
      "title": "South Korea 25 of 30",
      "description": "What business did Samsung initially do?",
      "buttonsTexts": ["Beer", "Noodle making", "Groceries", "Ask Friend"],
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
      "title": "South Korea 26 of 30",
      "description": "What is the leading religion in South Korea?",
      "buttonsTexts": ["Pyongyang", "Silla", "Koguryo", "Ask Friend"],
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
      "title": "South Korea 27 of 30",
      "description": "In what year was the Silla dynasty overthrown?",
      "buttonsTexts": ["935", "936", "937", "Ask Friend"],
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
      "title": "South Korea 28 of 30",
      "description": "In what year was the Korean alphabet formed?",
      "buttonsTexts": ["1446", "1408", "1298", "Ask Friend"],
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
      "title": "South Korea 29 of 30",
      "description": "In what year was Korea colonized by Japan?",
      "buttonsTexts": ["1905", "1906", "1907", "Ask Friend"],
      "buttonAnswers": [1, 0, 0, 0],
      "answersCount": 1,
      "goIndexes": [29, 29, 29, 10002],
      "answerPicture": "",
      "answerPictureDelay": 0,
      "goConditions": [],
      "heroValues": [],
      "picturesSpriteNames": ["", "", "", "", "", ""]
    },
    {
      "title": "South Korea 30 of 30",
      "description": "The Japanese left Korea in what year?",
      "buttonsTexts": ["1918", "1945", "1944", "Ask Friend"],
      "buttonAnswers": [0, 1, 0, 0],
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
