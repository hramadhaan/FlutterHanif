import 'package:flutter/material.dart';
import 'package:semangat_flutter/answer.dart';
import 'package:semangat_flutter/question.dart';
import 'package:semangat_flutter/result.dart';
import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // TEMPAT FUNCTION
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color ?',
      'answers': [
        {
          'text': 'Black',
          'score': 10,
        },
        {
          'text': 'Red',
          'score': 5,
        },
        {
          'text': 'Green',
          'score': 3,
        },
        {
          'text': 'White',
          'score': 1,
        }
      ],
    },
    {
      'questionText': 'What\'s your favorite animal ?',
      'answers': [
        {
          'text': 'Rabbit',
          'score': 11,
        },
        {
          'text': 'Snake',
          'score': 11,
        },
        {
          'text': 'Elephant',
          'score': 5,
        },
        {
          'text': 'Lion',
          'score': 9,
        }
      ],
    },
    {
      'questionText': 'What\'s your favorite instructor ?',
      'answers': [
        {
          'text': 'Max',
          'score': 1,
        },
        {
          'text': 'Max',
          'score': 1,
        },
        {
          'text': 'Max',
          'score': 1,
        },
        {
          'text': 'Max',
          'score': 1,
        },
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print('Answer Object ' + _questionIndex.toString());
    if (_questionIndex <= _questions.length) {
      print('We have more questions !');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(
                resultScore: _totalScore,
                resetHandler: _resetQuiz,
              ),
      ),
    );
  }
}