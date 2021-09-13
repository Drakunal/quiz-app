import 'package:flutter/material.dart';
import 'package:quiz_app/model/Question.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentIndex = 0;
  List questions = [
    Question.name("Are you female", false),
    Question.name("Are you male?", true)
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
                    questions[_currentIndex].question_text,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
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
                    onPressed: _nextQues, child: Icon(Icons.arrow_forward))
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  _checkAnswer(bool choice) {
    if (choice == questions[_currentIndex].is_correct) {
      debugPrint("Correct");
    } else {
      debugPrint("Not correct");
    }
  }

  _nextQues() {
    setState(() {
      _currentIndex++;
      if (_currentIndex >= questions.length) {
        _currentIndex = 0;
      }
    });
  }
}
