import 'package:flutter/material.dart';

void main() => runApp(Quests());

class Quests extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      appBar: AppBar(
        title: Text('Glowbom Quests'),
      ),
      body: Text('Welcome to Glowbom Quests'),
    ),);
  }
}