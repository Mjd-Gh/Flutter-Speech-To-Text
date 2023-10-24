import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:speech_recogntion/widgets/home_screemn_widgets/custom_card_container.dart';

List motivationalWords = [
  'Every small step you take is a step closer to success',
  'Believe in yourself and you will achieve great things',
  'Mistakes are proof that you are trying, keep going!',
];

class CardScroller extends StatefulWidget {
  const CardScroller({super.key});

  @override
  State<CardScroller> createState() => _CardScrollerState();
}

class _CardScrollerState extends State<CardScroller> {
  final CarouselController _controller = CarouselController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _controller,
          items: [
            CustomCard(
              content: motivationalWords[1],
              cardColor: const Color(0xFFC8DCCA),
            ),
            CustomCard(
              content: motivationalWords[0],
              cardColor: Colors.white,
            ),
            CustomCard(
              content: motivationalWords[2],
              cardColor: const Color(0xFFC8DCCA),
            ),
          ],
          options: CarouselOptions(
            viewportFraction: 1,
            height: 170,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index; // For chanhing bottom dots
              });
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        // Dots Row
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) {
              return Container(
                width: 8.0,
                height: 8.0,
                margin: const EdgeInsets.symmetric(horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index
                      ? const Color(0xFF91B094)
                      : const Color.fromARGB(255, 201, 200, 200),
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 25,
        )
      ],
    );
  }
}
