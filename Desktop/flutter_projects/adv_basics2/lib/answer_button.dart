import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.ontap, this.answerText, {super.key});
  final void Function() ontap;
  final String answerText;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      ),
      onPressed: ontap,
      child: Text(answerText, textAlign: TextAlign.center),
    );
  }
}
