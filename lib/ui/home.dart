import 'package:flutter/material.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
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
          children: [
            Image.asset(
              "images/logo.png",
              width: 400,
            )
          ],
        ),
      ),
    );
  }
}
