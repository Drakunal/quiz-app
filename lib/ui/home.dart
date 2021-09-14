import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/model/Question.dart';
import 'package:quiz_app/model/Score.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentIndex = 0;
  int _correct = 0;
  int _incorrect = 0;
  String _text = "Press Next to start";

  int _numberOfVisited = 0;
  double score = 0;
  List questions = [
    Question.name("Is Asia a country?", false, false),
    Question.name("Australia is both a country and continent.", true, false),
    Question.name("Plants contain chlorophyll.", true, false),
    Question.name("Is operating system a software?", true, false),
    Question.name("Are leaves white in color?", false, false),
    Score.name("Your score is : ", 0)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(2, 200, 100, 0.9),
      ),
      backgroundColor: Colors.lightGreen.shade100,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "images/logo.png",
                  width: 200,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                        color: Colors.grey, style: BorderStyle.solid)),
                height: 100,
                width: 300,
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _text,
                    style: const TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () => _checkAnswer(true),
                    child: const Text("True")),
                ElevatedButton(
                    onPressed: () => _checkAnswer(false),
                    child: const Text("False")),
                ElevatedButton(
                    onPressed: _nextQues,
                    child: const Icon(Icons.arrow_forward))
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  _checkAnswer(bool choice) {
    if (_currentIndex != questions.length - 1) {
      if (choice == questions[_currentIndex].is_correct) {
        setState(() {
          _correct++;
          questions[_currentIndex].is_visited = true;
          _numberOfVisited++;
        });

        _nextQues();
      } else {
        _incorrect++;
        setState(() {
          questions[_currentIndex].is_visited = true;
          _numberOfVisited++;
        });

        _nextQues();
      }
    }
  }

  _nextQues() {
    if (_numberOfVisited >= questions.length - 1) {
      setState(() {
        score = (_correct / (_correct + _incorrect)) * 100;
        _currentIndex = questions.length - 1;
        _text = questions[_currentIndex].text;
        questions[_currentIndex].value = score;
        _text = _text + " " + score.toString() + " %";
      });
    } else {
      debugPrint("The current index is $_currentIndex");
      setState(() {
        int temp = _currentIndex;
        temp++;
        if (temp >= questions.length - 1) {
          temp = 0;
        }
        bool isVisited = false;
        if (temp < questions.length - 1) {
          isVisited = questions[temp].is_visited;
        }

        while (isVisited) {
          temp++;
          if (temp >= questions.length - 1) {
            temp = 0;
          }

          isVisited = questions[temp].is_visited;
        }
        _currentIndex = temp;
        // _currentIndex++;
        // if (_currentIndex >= questions.length - 1) {
        //   _currentIndex = 0;
        // }
        _text = questions[_currentIndex].question_text;
      });
    }

    // if (_numberOfVisited < questions.length - 1) {
    //   int temp = _currentIndex;
    //   while (questions[temp].is_visited = true) {
    //     temp++;
    //     if (temp >= questions.length) {
    //       temp = 0;
    //     }
    //   }
    //   setState(() {
    //     _currentIndex = temp;
    //   });
    // } else {
    //   setState(() {
    //     _currentIndex = 0;
    //   });
    // }
  }
}
