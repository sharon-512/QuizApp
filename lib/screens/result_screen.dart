// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quizapp/screens/qestions_summary.dart';
import 'package:quizapp/screens/questions.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required this.selectedAnswer});
  final List<String> selectedAnswer;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < selectedAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'selected_answer': selectedAnswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                  'Total number of correct answer is ${numberOfCorrectAnswer(getSummaryData())}'),
              QuestionsSummary(summaryData: getSummaryData()),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: () {}, child: Text('Restart'))
            ],
          ),
        ),
      ),
    );
  }

  int numberOfCorrectAnswer(final List<Map<String, Object>> getSummaryData) {
    final count = getSummaryData.where((element) {
      return element['correct_answer'] == element['selected_answer'];
    });
    int totalCount = count.length;
    return totalCount;
  }
}
