import 'package:flutter/material.dart';

class ExerciseContent extends StatelessWidget {
  const ExerciseContent({
    super.key,
    required String exercise,
  }) : _exercise = exercise;

  final String _exercise;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 70,
          horizontal: 30,
        ),
        padding: const EdgeInsets.only(top: 50),
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.8,
        // color: Colors.amber,
        child: Text(
          _exercise,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            fontFamily: 'TiltNeon',
            color: Colors.white,
            shadows: [
              Shadow(
                  // bottomLeft
                  offset: Offset(-2, -2),
                  color: Color(0xFF4B4B4B)),
              Shadow(
                  // bottomRight
                  offset: Offset(2, -2),
                  color: Color(0xFF4B4B4B)),
              Shadow(
                  // topRight
                  offset: Offset(2, 2),
                  color: Color(0xFF4B4B4B)),
              Shadow(
                  // topLeft
                  offset: Offset(-2, 2),
                  color: Color(0xFF4B4B4B)),
            ],
          ),
        ),
      ),
    );
  }
}

