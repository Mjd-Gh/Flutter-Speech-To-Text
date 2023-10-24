import 'package:flutter/material.dart';
import 'package:speech_recogntion/screens/exercise_screen.dart';

class ExerciseContainer extends StatelessWidget {
  const ExerciseContainer({
    super.key,
    required this.lessonList,
    required this.index,
  });

  final List lessonList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ExerciseScreen(exercise: lessonList, index: index),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFDF5DA),
              Color(0xFFF5E8B7),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(122, 137, 136, 136),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(1, 2),
            )
          ],
        ),
        child: Center(
          child: Text(
            "${lessonList[index].id}",
            style: const TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
              fontFamily: 'TiltNeon',
              color: Colors.white,
              shadows: [
                Shadow(
                    // bottomLeft
                    offset: Offset(-1.5, -1.5),
                    color: Color(0xFF4B4B4B)),
                Shadow(
                    // bottomRight
                    offset: Offset(1.5, -1.5),
                    color: Color(0xFF4B4B4B)),
                Shadow(
                    // topRight
                    offset: Offset(1.5, 1.5),
                    color: Color(0xFF4B4B4B)),
                Shadow(
                    // topLeft
                    offset: Offset(-1.5, 1.5),
                    color: Color(0xFF4B4B4B)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
