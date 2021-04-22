import 'package:flutter/material.dart';
import 'package:nlw/challenge/challenge_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "DevQuiz",
        debugShowCheckedModeBanner: false,
        home: ChallengePage());
  }
}
