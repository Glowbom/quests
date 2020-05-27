import 'package:flutter/material.dart';

void main() => runApp(Quests());

class Quests extends StatelessWidget {
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
            Text('Question 1'),
            RaisedButton(
              child: Text('Answer 1'),
              onPressed: null,
            ),
            RaisedButton(
              child: Text('Answer 2'),
              onPressed: null,
            ),
            RaisedButton(
              child: Text('Answer 3'),
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }
}
