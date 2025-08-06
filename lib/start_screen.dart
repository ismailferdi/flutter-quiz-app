import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  // Static const values to prevent recreation
  static const _logoColor = Color.fromARGB(150, 255, 255, 255);
  static const _titleTextStyle = TextStyle(
    color: Color.fromARGB(255, 237, 223, 252),
    fontSize: 24,
    fontFamily: 'lato',
  );
  static const _logoSpacing = SizedBox(height: 80);
  static const _buttonSpacing = SizedBox(height: 30);
  static const _buttonIcon = Icon(Icons.arrow_right_alt);
  static const _buttonText = Text("Start Quiz");

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            height: 200,
            width: 300,
            color: _logoColor,
          ),
          _logoSpacing,
          const Text('Learn Flutter the fun way!', style: _titleTextStyle),
          _buttonSpacing,
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            label: _buttonText,
            icon: _buttonIcon,
          ),
        ],
      ),
    );
  }
}
