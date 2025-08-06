import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  // Static const values to prevent recreation
  static const _containerSize = 24.0;
  static const _borderRadius = BorderRadius.all(Radius.circular(12));
  static const _horizontalSpacing = SizedBox(width: 30);
  static const _verticalSpacing = SizedBox(height: 2);
  static const _bottomSpacing = SizedBox(height: 20);

  static final _questionTextStyle = TextStyle(color: Colors.purple[200]);
  static const _userAnswerTextStyle = TextStyle(color: Colors.purpleAccent);
  static const _correctAnswerTextStyle = TextStyle(color: Colors.greenAccent);
  static const _numberTextStyle = TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            final isCorrect = data['user_answer'] == data['correct_answer'];

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: _containerSize,
                  height: _containerSize,
                  decoration: BoxDecoration(
                    borderRadius: _borderRadius,
                    color: isCorrect ? Colors.greenAccent : Colors.pinkAccent,
                  ),
                  child: Center(
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: _numberTextStyle,
                    ),
                  ),
                ),
                _horizontalSpacing,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: _questionTextStyle,
                        textAlign: TextAlign.start,
                      ),
                      _verticalSpacing,
                      Text(
                        data['user_answer'] as String,
                        style: _userAnswerTextStyle,
                      ),
                      _verticalSpacing,
                      Text(
                        data['correct_answer'] as String,
                        style: _correctAnswerTextStyle,
                      ),
                      _bottomSpacing,
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
