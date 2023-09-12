class QuizQuestion {
  const QuizQuestion(this.question, this.answer);

  final String question;
  final List<String> answer;

  List<String> getShuffledAnswer(){
    final shuffleAnswer = List.of(answer);
    shuffleAnswer.shuffle();
    return shuffleAnswer;
  }
}