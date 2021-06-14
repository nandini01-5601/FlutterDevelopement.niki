import 'package:flutter/material.dart';
import 'question.dart';
import 'quizzbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizzBrain quizzBrain = QuizzBrain();

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizApp(),
          ),
        ),
      ),
    );
  }
}

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {

  List <Widget> scorekeeper = [];

  void checkAnswer(bool userAnswer) {
    setState(() {
      if(quizzBrain.isFinished()) {
        Alert(
          context: context,
          title: "Finished!!",
          desc: "You've reached the end of the quizz.",
        ).show();
        quizzBrain.reset();
        scorekeeper = [];
      }
      else {
        if(quizzBrain.getAnswers() == userAnswer) {
          correct++;
          scorekeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        }
        else {
          wrong++;
          scorekeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        quizzBrain.nextQuestion();
      }
    });
  }

  // List <Question> test = [
  //   Question(q: 'The Sun rises in the east.' , a: true),
  //   Question(q: 'The Sun rises in the west.' , a: false),
  //   Question(q: 'The sun does not rise everyday.' , a: false),
  // ];

  int correct = 0;
  int wrong = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget> [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizzBrain.getQuestions(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FlatButton(
              color: Colors.green,
              onPressed: () {
                checkAnswer(true);
              },
              child: Text(
                'True',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FlatButton(
              color: Colors.red,
              onPressed: () {
                checkAnswer(false);
              },
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scorekeeper,
        ),
      ],
    );
  }
}


