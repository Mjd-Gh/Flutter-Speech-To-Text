import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:speech_recogntion/main.dart';
import 'package:speech_recogntion/widgets/home_screemn_widgets/level_card.dart';

List<Widget> levelCards = [
  LevelCard(
    level: 1,
    cardColor: const [
      Color(0xFF9CB69E),
      Color(0xFF9CB69E),
    ],
    sentence: 'Master Easy English Phrases!',
    levelLessons: level1,
    percent: 0.9,
    number: '90%',
  ),
  LevelCard(
    level: 2,
    cardColor: const [
      Color(0xFF7D9C80),
      Color(0xFF7D9C80),
    ],
    sentence: 'Building Fluency!',
    levelLessons: level2,
    percent: 0.2,
    number: '20%',
  ),
  LevelCard(
    level: 3,
    cardColor: const [
      Color(0xFF658368),
      Color(0xFF658368),
    ],
    sentence: 'Fluent Communication!',
    levelLessons: level3,
    percent: 0.0,
    number: '0%',
  ),
];

class AnimatedCardLevelList extends StatefulWidget {
  const AnimatedCardLevelList({super.key});

  @override
  State<AnimatedCardLevelList> createState() => _AnimatedCardLevelListState();
}

class _AnimatedCardLevelListState extends State<AnimatedCardLevelList> {
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 18.0, bottom: 10),
            child: Text(
              "Learning Levels",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                fontFamily: 'TiltNeon',
                color: Color.fromARGB(255, 81, 80, 80),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: levelCards.length,
              itemBuilder: (BuildContext context, int index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(seconds: 1),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 7.0),
                        child: levelCards[index],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
