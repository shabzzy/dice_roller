import 'package:flutter/material.dart';

class Textstyle extends StatelessWidget {
  const Textstyle(this.text, {super.key});
  final String text;
  @override
  Widget build(context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 40,
        fontWeight: FontWeight.bold,
        fontFamily: 'Times new roman',
      ),
    );
  }
}
