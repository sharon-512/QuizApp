import 'package:flutter/material.dart';
import 'package:quizapp/screens/display_question.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.purple, Color.fromARGB(255, 41, 3, 48)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/quiz-logo.png',
                  width: 200,
                  color: const Color.fromARGB(155, 255, 255, 255),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Learn Flutter The Fun Way!',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 107, 4, 126),
                    ),
                    icon: const Icon(Icons.arrow_right_alt),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DisplayQuestions(),
                          ));
                    },
                    label: const Text('START',
                        style: TextStyle(color: Colors.white)))
              ]),
        ),
      ),
    );
  }
}
