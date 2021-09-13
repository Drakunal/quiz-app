import 'package:flutter/material.dart';
import 'package:quiz_app/model/Question.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List questions = [Question.name("bara choda", true)];
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
                    questions[0].question_text,
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
                    onPressed: _checkAnswer, child: const Text("True")),
                ElevatedButton(
                    onPressed: _checkAnswer, child: const Text("False")),
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

  _checkAnswer() {}

  _nextQues() {}
}
