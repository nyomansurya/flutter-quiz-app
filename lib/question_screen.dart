import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/question.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelecAnswer}); //onSelected answer is named argument who catch chooseAnswer function from quiz.dart 

  final void Function(String answer) onSelecAnswer; //the onSelecAnswer is receive string argument who will pass chooseAnswer function at quiz.dart

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  
  var currentIndex = 0;
  void answerQuestion(String selectedAnswer) {
    widget.onSelecAnswer(selectedAnswer); //calling the named argument who contain chooseAnswer function from quiz.dart
    //to add +1 to currentIndex
    setState(() {
      currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = question[currentIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 166, 175, 255),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ...currentQuestion.getShuffledAnswer().map(
                  (answer) => AnswerButton(
                    answerText: answer,
                    onPressed: (){
                      answerQuestion(answer); //the answerQuestion who contain onSelectedAnswer receive argument who will send to chooseAnswer function
                    },
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
