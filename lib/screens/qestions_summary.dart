// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuestionsSummary extends StatelessWidget {
  QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;
  int numberOfCorrectAnswer = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 760,
      child: Column(
        children: [
          Column(
            children: summaryData.map((data) {
              if (data['correct_answer'] == data['selected_answer']) {
                numberOfCorrectAnswer++;
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(((data['question_index'] as int) + 1).toString()),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text((data['question'] as String)),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                            'CORRECT ANSWER: ${(data['correct_answer'] as String)}'),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            'SELECTED ANSWER: ${(data['selected_answer'] as String)}'),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  )
                ],
              );
            }).toList(),
          ),
          Text('number of correct answer:: $numberOfCorrectAnswer'),
        ],
      ),
    );
  }
}
