import 'package:flutter/material.dart';

class QuestionNumber extends StatelessWidget {
  const QuestionNumber(this.isCorrect, this.questionIndex, {super.key});

  final bool isCorrect;
  final int questionIndex;

  // final bool correct =
  @override
  Widget build(BuildContext context) {
    final int questionNumber = questionIndex + 1;

    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrect ? Colors.green.shade400 : Colors.blue.shade400,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        questionNumber.toString(),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
