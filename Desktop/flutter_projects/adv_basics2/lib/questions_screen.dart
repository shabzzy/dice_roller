//import 'package:adv_basics2/start_screen.dart';
import 'package:adv_basics2/data/question.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adv_basics2/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.goBack, this.onSelectAnswer, {super.key});
  final void Function() goBack;
  final void Function(String) onSelectAnswer;
  @override
  State<StatefulWidget> createState() {
    return _QuestionScreen();
  }
}

class _QuestionScreen extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer); //sends selected answer to quiz
    setState(() {
      currentQuestionIndex++; //move the next question
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,

      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          //children: [ElevatedButton(onPressed: pressme, child: Text('press me'))],
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            ...currentQuestion.shuffleAnswer().map((e) {
              return AnswerButton(() {
                answerQuestion(e);
              }, e);
            }),
            // AnswerButton(() {}, currentQuestion.answers[0]),
            // AnswerButton(() {}, currentQuestion.answers[1]),
            // AnswerButton(() {}, currentQuestion.answers[2]),
            // AnswerButton(() {}, currentQuestion.answers[3]),
            SizedBox(height: 40),
            OutlinedButton(
              onPressed: widget.goBack,
              child: Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
