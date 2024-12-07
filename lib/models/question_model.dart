//class model for our questions
class Question {
  final String id;
  final String firstNumber;
  final String secondNumber;
  final Map<String, bool> options;

  Question({
    required this.id,
    required this.firstNumber,
    required this.secondNumber,
    required this.options,
});


}