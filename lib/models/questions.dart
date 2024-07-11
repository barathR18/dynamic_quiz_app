import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/question.dart';

Future<List<Question>> fetchQuestions() async {
  final response =
      await http.get(Uri.parse('https://opentdb.com/api.php?amount=10'));
  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    final List<dynamic> results = data['results'];
    List<Question> questions =
        results.map((json) => Question.fromJson(json)).toList();
    return questions;
  } else {
    throw Exception('Failed to load questions');
  }
}
