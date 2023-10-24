// ignore: file_names
import 'package:flutter/material.dart';
import 'package:speech_recogntion/widgets/home_screemn_widgets/animaited_level_list.dart';
import 'package:speech_recogntion/widgets/home_screemn_widgets/card_scroller.dart';
import 'package:speech_recogntion/widgets/user_info_row.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  
  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            UserInfoRow(),
            SizedBox(
              height: 30,
            ),
            CardScroller(),
            SizedBox(
              height: 10,
            ),
            Expanded(child: AnimatedCardLevelList()),
          ],
        ),
      ),
    );
  }
}

