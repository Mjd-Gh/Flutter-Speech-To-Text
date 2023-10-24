import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:speech_recogntion/screens/lessons_screen.dart';

class LevelCard extends StatelessWidget {
  const LevelCard({
    super.key,
    required this.level,
    required this.cardColor,
    required this.sentence,
    required this.levelLessons,
    required this.percent,
    required this.number,
  });

  final int level;
  final List<Color> cardColor;
  final String sentence;
  final List levelLessons;
  final double percent;
  final String number;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LessonScreen(
              levelLessons: levelLessons,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.145,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: cardColor,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(163, 170, 170, 170),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(-1, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Level $level",
                    style: const TextStyle(
                      fontSize: 40,
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
                  Text(
                    sentence,
                    style: const TextStyle(
                      fontSize: 15,
                      fontFamily: 'TiltNeon',
                      color: Color(0xFFE9E7E7),
                    ),
                  ),
                ],
              ),
            ),
            CircularPercentIndicator(
              radius: 35.0,
              lineWidth: 9.0,
              percent: percent,
              center: Text(
                number,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'TiltNeon',
                  color: Colors.white,
                ),
              ),
              backgroundColor: const Color.fromARGB(120, 255, 255, 255),
              progressColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
