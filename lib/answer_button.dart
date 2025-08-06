import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.answer, required this.onTap});

  final String answer;
  final void Function() onTap;

  // Static const values prevent recreation on each build
  static const _backgroundColor = Color.fromARGB(150, 33, 1, 95);
  static const _borderRadius = BorderRadius.all(Radius.circular(40));
  static const _padding = EdgeInsets.symmetric(vertical: 10, horizontal: 40);
  static const _shape = RoundedRectangleBorder(borderRadius: _borderRadius);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: _backgroundColor,
        foregroundColor: Colors.white,
        shape: _shape,
        padding: _padding,
      ),
      child: Text(answer, textAlign: TextAlign.center),
    );
  }
}
