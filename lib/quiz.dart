import 'package:adv_basics/question_screen.dart';
import 'package:adv_basics/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/data/question.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer =
      []; //to catch asnwer who selected at question screen
  String activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    //function for adding answer who selected at question screen
    selectedAnswer.add(answer);
    if (selectedAnswer.length == question.length) {
      //condition who will stop the question screen cycling when user already answer all questioin
      setState(() {
        activeScreen = 'result-screen';
        // selectedAnswer = [];
      });
    }
    // print("selectedAnswer = $selectedAnswer");
  }

  void restartQuiz(){
    setState(() {
      activeScreen = 'question-screen';
    selectedAnswer = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 0, 82, 150),
                Color.fromARGB(255, 0, 27, 51),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen == 'start-screen'
              ? StartScreen(switchScreen)
              : activeScreen == 'result-screen'
                  ? ResultScreen(choosenAnswer: selectedAnswer, restartQuiz: restartQuiz,)
                  : QuestionScreen(
                      onSelecAnswer:
                          chooseAnswer), //passing the chooseAnswer function to question_screen.dart
        ),
      ),
    );
  }
}
