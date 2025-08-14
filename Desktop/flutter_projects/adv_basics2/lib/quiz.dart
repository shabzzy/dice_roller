//import 'package:adv_basics2/data/question.dart';
import 'package:adv_basics2/data/question.dart';
import 'package:adv_basics2/questions_screen.dart';
import 'package:adv_basics2/result_screen.dart';
import 'package:adv_basics2/start_screen.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<StatefulWidget> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> {
  List<String> selectedAnswers = [];
  // Widget? activescreen;
  // @override
  // void initState() {
  //   activescreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  var activeScreen = 'start_screen';
  void switchScreen() {
    setState(() {
      // activescreen = const QuestionsScreen();
      activeScreen = 'question_screen';
    });
  }

  void switchtobackToStartScreen() {
    setState(() {
      // activescreen =  StartScreen(switchScreen);
      activeScreen = 'start_screen';
    });
  }

  void answerQuestion(String answers) {
    selectedAnswers.add(answers); // stores the selected answer
    if (selectedAnswers.length == questions.length) {
      setState(() {
        // activescreen =  StartScreen(switchScreen);
        activeScreen = 'result_screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'question_screen') {
      screenWidget = QuestionsScreen(switchtobackToStartScreen, answerQuestion);
    }
    if (activeScreen == 'result_screen') {
      screenWidget = ResultScreen();
    }
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color.fromARGB(225, 78, 13, 151),
            const Color.fromARGB(255, 107, 15, 168),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      //child: activescreen,
      child: screenWidget,
      // child: activescreen == 'start_screen'
      //     ? StartScreen(switchScreen)
      //     : QuestionsScreen(switchtoQuestion),
    );
  }
}
