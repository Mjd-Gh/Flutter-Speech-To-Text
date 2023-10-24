import 'package:flutter/material.dart';
import 'package:speech_recogntion/data/lesson_data.dart';
import 'package:speech_recogntion/model/lessons_model.dart';
import 'package:speech_recogntion/screens/HomeScreen.dart';

// Convert data
Lessons lesson = Lessons.fromJson(lessonData);
// Access the list of lessons
List<Lesson>? lessonsList = lesson.lessons;
List level1 = [];
List level2 = [];
List level3 = [];
int userPoint = 0;

void main() {
  for (var element in lessonsList!) {
    if (element.level == 'beginner') {
      level1.add(element);
    } else if (element.level == 'intermediate') {
      level2.add(element);
    } else {
      level3.add(element);
    }
  }

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
