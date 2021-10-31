class Question {
  String question;
  bool answer;

  Question(this.question, this.answer);

  bool isAnswerCorrect(bool answer) {
    return this.answer == answer;
  }
}
