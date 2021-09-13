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
            Container(
              height: 100,
              child: Text(questions[0].question_text),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
