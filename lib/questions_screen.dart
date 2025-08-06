import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
//import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  // Static const values to prevent recreation
  static const _containerMargin = EdgeInsets.all(40);
  static const _questionTextStyle = TextStyle(
    color: Color.fromARGB(255, 201, 153, 251),
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static const _spacing = SizedBox(height: 30);
  static const _answerSpacing = SizedBox(height: 10);

  void answerQuestion(String answer) {
    widget.onSelectAnswer(answer);
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: _containerMargin,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: _questionTextStyle,
              textAlign: TextAlign.center,
            ),
            _spacing,
            ...currentQuestion.getShuffledAnswers().map(
              (answer) => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _answerSpacing,
                  AnswerButton(
                    answer: answer,
                    onTap: () => answerQuestion(answer),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
