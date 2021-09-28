import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/ui/home.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
          // brightness: Brightness.dark,
          // primaryColor: Colors.lightBlue[800], //not working
          colorScheme: ColorScheme(
              primary: Colors.yellow,
              primaryVariant: Colors.blue,
              secondary: Colors.purple,
              secondaryVariant: Colors.pink,
              surface: Colors.green,
              background: Colors.red,
              error: Colors.red,
              onPrimary: Colors.grey,
              onSecondary: Colors.deepPurpleAccent,
              onSurface: Colors.pink.shade200,
              onBackground: Colors.indigo.shade800,
              onError: Colors.red,
              brightness: Brightness.light),
          // elevatedButtonTheme: ElevatedButtonTheme(data: e, child: child),
          textTheme: TextTheme(
            bodyText1: TextStyle(fontSize: 30), //nw
            bodyText2: TextStyle(fontSize: 19), //working
            headline1:
                TextStyle(fontSize: 45, fontWeight: FontWeight.bold), //nw
          )),
      home: QuizApp(),
    ));
