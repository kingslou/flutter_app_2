import 'package:flutter/material.dart';
import 'package:flutter_app_2/RandomWordState.dart';
import 'package:english_words/english_words.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.lightBlue,
        // This makes the visual density adapt to the platform that you run
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:new RandomWords()
    );
  }
}


class RandomWords extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
      return new RandomWordState();
  }
}
