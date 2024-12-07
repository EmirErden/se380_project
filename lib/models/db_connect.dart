import 'package:http/http.dart' as http;
import 'question_model.dart';
import 'dart:convert';

class DBConnect {
  final url = Uri.parse(
      'https://se380project-d7026-default-rtdb.europe-west1.firebasedatabase.app/questions.json');

  Future<void> addQuestions(Question question) async {
    http.post(url,
        body: json.encode({
          'firstNumber': question.firstNumber,
          'secondNumber': question.secondNumber,
          'options': question.options
        }));
  }

  Future<void> fetchQuestions() async {
    http.get(url).then((response) {
      var data = jsonDecode(response.body);
      print(data);
    });
  }
}
