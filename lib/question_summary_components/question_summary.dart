import 'package:adv_basics/question_summary_components/summary_item.dart';
import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData,
      {super.key, required this.correctAnswer, required this.totalAnswer});

  final List<Map<String, Object>> summaryData;
  final int correctAnswer;
  final int totalAnswer;

  @override
  Widget build(BuildContext context) {


  

    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return SummaryItem(data);
            },
          ).toList(),
        ),
      ),
    );
  }
}
