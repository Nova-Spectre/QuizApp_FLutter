import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultscore;

  final Function resetHandler;

  Result({this.resultscore, this.resetHandler});

  String get resultPhrase {
    String resultText;
    if (resultscore <= 8) {
      resultText = 'You are Bad !';
    } else if (resultscore <= 16) {
      resultText = 'You are ... Strange?!';
    } else {
      resultText = 'You are awesome and innocent';
    }

    return resultText;
  }

  String get totalScore {
    String getScore;
    getScore = resultscore.toString();
    return getScore;
  }

  @override
  Widget build(BuildContext context) {
    int ss = resultscore;
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Text(
              'Score \n',
              style: TextStyle(
                  fontSize: 45,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            totalScore,
            style: TextStyle(fontSize: 190, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            resultPhrase,
            style: TextStyle(
                fontSize: 20,
                color: resultscore > 16 ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150.0),
            child: FlatButton(
              child: Text('Restart Quiz !'),
              color: Colors.red[600],
              textColor: Colors.white,
              hoverColor: Colors.red,
              splashColor: Colors.green,
              onPressed: resetHandler,
              height: 60.0,
            ),
          )
        ],
      ),
    );
  }
}
