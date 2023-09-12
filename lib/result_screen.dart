import 'package:adv_basics/data/question.dart';
import 'package:adv_basics/question_summary_components/question_summary.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.choosenAnswer, required this.restartQuiz});

  final List<String> choosenAnswer;
  final void Function() restartQuiz;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswer.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': question[i].question,
          'correct_answer': question[i].answer[0],
          'user_answer': choosenAnswer[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = question.length;
    final numCorrectAnswer = summaryData.where((answer) {
      return answer['user_answer'] == answer['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectAnswer out of $numTotalQuestions question correctly',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 215, 179, 253),
              ),
            ),
            const SizedBox(height: 30),
            QuestionSummary(
              summaryData,
              correctAnswer: numCorrectAnswer,
              totalAnswer: numTotalQuestions,
            ),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: restartQuiz,
              label: const Text(
                'Restart Quiz!',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              icon: const Icon(
                Icons.restart_alt_outlined,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
