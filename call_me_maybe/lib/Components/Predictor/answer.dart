import 'dart:math';
import 'package:flutter/material.dart';

class Answer {

  Random random = Random();
  String _currentAnswer;
  Color _color;
  final _responses = [ 
    "Most likely",
    "You may rely on it",
    "Outlook good",
    "Reply hazy, try again",
    "Concentrate and ask again",
    "Outlook not so good",
    "Don't count on it",
    "My sources say no"
  ];

  Answer() : _currentAnswer = "";

  String get currentAnswer => _currentAnswer;
  Color get color => _color;

  void getNextAnswer() {
    final  index = random.nextInt(_responses.length);
    _currentAnswer = _responses[index];
    if(index < 3)
    {
      _color = Colors.green;
    } else if(index < 5) {
      _color = Colors.yellow;
    } else {
      _color = Colors.red;
    }

  }

}