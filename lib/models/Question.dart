import 'package:dart_mappable/dart_mappable.dart';

part 'Question.mapper.dart';

@MappableClass()
class Question with QuestionMappable {
  final int id;
  final String firstNumber;
  final String secondNumber;
  final Map<String, bool> options;

  Question(
      {required this.id,
      required this.firstNumber,
      required this.secondNumber,
      required this.options});
}
