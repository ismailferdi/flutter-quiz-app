import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswers,
    required this.restartQuiz,
  });

  final List<String> chosenAnswers;
  final void Function() restartQuiz;

  // Static const values to prevent recreation
  static const _containerMargin = EdgeInsets.all(40);
  static const _titleTextStyle = TextStyle(
    color: Color.fromARGB(150, 255, 255, 255),
    fontWeight: FontWeight.bold,
  );
  static const _spacing = SizedBox(height: 30);
  static const _buttonIcon = Icon(Icons.arrow_back, color: Colors.white);
  static const _buttonTextStyle = TextStyle(color: Colors.white);

  List<Map<String, Object>> _getSummaryData() {
    return List.generate(
      chosenAnswers.length,
      (i) => {
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = _getSummaryData();
    final correctAnswers = summaryData
        .where((data) => data['correct_answer'] == data['user_answer'])
        .length;
    final totalQuestions = questions.length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: _containerMargin,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctAnswers out of $totalQuestions questions correctly',
              style: _titleTextStyle,
            ),
            _spacing,
            QuestionsSummary(summaryData),
            _spacing,
            TextButton.icon(
              onPressed: restartQuiz,
              icon: _buttonIcon,
              label: const Text('Restart Quiz', style: _buttonTextStyle),
            ),
          ],
        ),
      ),
    );
  }
}
