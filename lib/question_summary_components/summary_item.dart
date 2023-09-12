import 'package:flutter/material.dart';
import 'package:adv_basics/question_summary_components/question_number.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.data, {super.key});

  final Map<String, Object> data;

  @override
  Widget build(BuildContext context) {
    final bool isCorrect = data['user_answer'] == data['correct_answer'];
    final int questionIndex = data['question_index'] as int;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionNumber(isCorrect, questionIndex),
        const SizedBox(width: 20),
        Expanded(
          //expanded widget will fill all widht who not ignoring the widget who wrap the expanded
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data['question'] as String,
                style: const  TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue),
              ),
              const SizedBox(height: 5),
              Text(
                data['user_answer'] as String,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              const SizedBox(height: 5),
              Text(
                data['correct_answer'] as String,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.green.shade400,
                ),
              ),
              const SizedBox(height: 10,)
            ],
          ),
        ),
      ],
    );
  }
}
