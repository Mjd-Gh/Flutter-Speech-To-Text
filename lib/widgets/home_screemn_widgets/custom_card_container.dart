import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.content,
    required this.cardColor,
  });

  final String content;
  final Color cardColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, bottom: 0, top: 25),
      height: 160,
      width: 290,
      child: Text(
        content,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: cardColor,
          fontFamily: 'TiltNeon',
          shadows: const [
            Shadow(
                // bottomLeft
                offset: Offset(-1, -1),
                color: Colors.black),
            Shadow(
                // bottomRight
                offset: Offset(1, -1),
                color: Colors.black),
            Shadow(
                // topRight
                offset: Offset(1, 1),
                color: Colors.black),
            Shadow(
                // topLeft
                offset: Offset(-1, 1),
                color: Colors.black),
          ],
        ),
      ),
    );
  }
}
