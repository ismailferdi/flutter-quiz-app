import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  // Static const values to prevent recreation
  static const _gradientColors = [
    Color.fromARGB(255, 78, 13, 151),
    Color.fromARGB(255, 107, 15, 168),
  ];
  static const _gradientDecoration = BoxDecoration(
    gradient: LinearGradient(
      colors: _gradientColors,
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  );

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    final Widget screenWidget = switch (activeScreen) {
      'start-screen' => StartScreen(switchScreen),
      'questions-screen' => QuestionsScreen(onSelectAnswer: chooseAnswer),
      _ => ResultScreen(
        chosenAnswers: selectedAnswers,
        restartQuiz: restartQuiz,
      ),
    };

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(decoration: _gradientDecoration, child: screenWidget),
      ),
    );
  }
}
