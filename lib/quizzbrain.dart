class QuizzBrain {

  int _questionNumber = 0;

  List <String> _questions = [
    'The Sun rises in the east.',
    'The Sun rises in the west.',
    'The sun does not rise everyday.'
  ];
  //give underscore before name to make the data member private
  List <bool> _answers = [
    true,
    false,
    false
  ];

  void nextQuestion() {
    if(_questionNumber < _questions.length-1) {
      _questionNumber++;
    }
  }

  bool getAnswers() {
    return _answers[_questionNumber];
  }

  String getQuestions() {
    return _questions[_questionNumber];
  }

  bool isFinished() {
    if(_questionNumber >= _questions.length-1) {
      return true;
    }
    return false;
  }

  void reset() {
    _questionNumber = 0;
  }
}