import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:speech_recogntion/widgets/lessons_screen_widgets/exercise_container.dart';
import 'package:speech_recogntion/widgets/user_info_row.dart';

class LessonScreen extends StatefulWidget {
   const LessonScreen({super.key, required this.levelLessons});

  final List levelLessons;


  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
              ),
              onPressed: () {
                // POP
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const UserInfoRow(),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      "${widget.levelLessons[0].level.toUpperCase()} Exercises", //TODO Passing Level Number here
                      style: const TextStyle(
                        fontSize: 25,
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
                    Expanded(
                      child: AnimationLimiter(
                        child: GridView.builder(
                          itemCount: widget.levelLessons.length,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            // crossAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            return AnimationConfiguration.staggeredGrid(
                              position: index,
                              columnCount: 2,
                              duration: const Duration(milliseconds: 1200),
                              child: SlideAnimation(
                                child: FadeInAnimation(
                                  child: ExerciseContainer(
                                    lessonList: widget.levelLessons,
                                    index: index,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

