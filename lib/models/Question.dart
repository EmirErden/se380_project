import 'package:dart_mappable/dart_mappable.dart';

part 'Question.mapper.dart';

@MappableClass()
class Question with QuestionMappable {
  final String id;
  final String firstNumber;
  final String secondNumber;
  final Map<String, bool> options;

  Question(this.id, this.firstNumber, this.secondNumber, this.options);
}
