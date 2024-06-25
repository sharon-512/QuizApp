// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/screens/questions.dart';
import 'package:quizapp/screens/result_screen.dart';

class DisplayQuestions extends StatefulWidget {
  DisplayQuestions({
    super.key,
  });

  @override
  State<DisplayQuestions> createState() => _DisplayQuestionsState();
}

class _DisplayQuestionsState extends State<DisplayQuestions> {
  var currentIndex = 0;
  final List<String> selectedAnswers = [];

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentIndex];

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 119, 13, 138),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  currentQuestion.text,
                  style: GoogleFonts.aBeeZee(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 199, 175, 226)),
                  textAlign: TextAlign.center,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  height: 400,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: currentQuestion.getSuffledAnswers().length,
                    itemBuilder: (BuildContext context, int index) {
                      return optionButtonItem(
                          answer: currentQuestion.getSuffledAnswers()[index],
                          onTap: () {
                            if (selectedAnswers.length !=
                                questions.length - 1) {
                              answerQuestions(
                                  currentQuestion.getSuffledAnswers()[index]);
                              print(selectedAnswers);
                            } else {
                              answerQuestions(
                                  currentQuestion.getSuffledAnswers()[index]);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ResultScreen(
                                      selectedAnswer: selectedAnswers,
                                    ),
                                  ));
                            }
                          });
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void answerQuestions(String selectedAnswer) {
    chooseAnswer(selectedAnswer);
    setState(() {
      currentIndex++;
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
  }
}

Widget optionButtonItem(
    {required String answer, required void Function() onTap}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          backgroundColor: Colors.white,
        ),
        child: Text(
          answer,
          textAlign: TextAlign.center,
        )),
  );
}
