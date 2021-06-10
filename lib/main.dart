import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/result.dart';
import './quiz.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'The World Largest desert is ?',
      'answer': [
        {'text': 'Thar', 'Score': 0},
        {'text': 'kalahari', 'Score': 0},
        {'text': 'Sahara', 'Score': 10},
        {'text': 'Sonoran', 'Score': 0},
      ],
    },
    {
      'questionText': 'Country that has the highest in Barley Production ? ',
      'answer': [
        {'text': 'China', 'Score': 0},
        {'text': 'India', 'Score': 0},
        {'text': 'Russia', 'Score': 10},
        {'text': 'France', 'Score': 0},
      ],
    },
    {
      'questionText': 'The metal whose salts are sensitive to light is ?',
      'answer': [
        {'text': 'Zinc', 'Score': 0},
        {'text': 'Silver', 'Score': 10},
        {'text': 'Copper', 'Score': 0},
        {'text': 'Aluminium', 'Score': 0},
      ],
    },
    {
      'questionText': 'The Central Rice Research Station is situated in ?',
      'answer': [
        {'text': 'Chennai', 'Score': 0},
        {'text': 'Cuttack', 'Score': 10},
        {'text': 'Bangalore', 'Score': 0},
        {'text': 'Quilion', 'Score': 0},
      ],
    },
    {
      'questionText': ' Which is considered as the biggest port of India ? ',
      'answer': [
        {'text': 'Kolkata', 'Score': 0},
        {'text': 'Coachin', 'Score': 00},
        {'text': 'Chennai', 'Score': 0},
        {'text': 'Mumbai', 'Score': 10},
      ],
    },
  ];
  var _QuestionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _QuestionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int Score) {
    _totalScore += Score;
    setState(() {
      _QuestionIndex = _QuestionIndex + 1;
    });
    print(_QuestionIndex);
    if (_QuestionIndex < _questions.length) {
      print('we have more questions ');
    } else {
      print('no more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text('Quiz app'),
        ),
        body: _QuestionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _QuestionIndex,
                questions: _questions,
              )
            : Result(
                resultscore: _totalScore,
                resetHandler: _resetQuiz,
              ),
      ),
    );
  }
}
