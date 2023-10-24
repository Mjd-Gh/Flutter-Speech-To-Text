import 'package:flutter/material.dart';
import 'package:speech_recogntion/main.dart';
import 'package:speech_recogntion/widgets/exercise_screen_widgets/exercise_content.dart';
import 'package:speech_recogntion/widgets/exercise_screen_widgets/listening_state.dart';
import 'package:speech_recogntion/widgets/exercise_screen_widgets/result_dialog.dart';
import 'package:speech_recogntion/widgets/user_info_row.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen(
      {super.key, required this.exercise, required this.index});

  final List exercise;
  final int index;

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  final stt.SpeechToText speech = stt.SpeechToText();
  bool _speechEnabled = false;
  String recognizedSpeech = "";
  bool notListeng = false;
  String _exercise = '';
  bool match = false;

  @override
  void initState() {
    super.initState();
    _exercise = widget.exercise[widget.index].exercise;
    initSpeech();
  }

  void initSpeech() async {
    _speechEnabled = await speech.initialize();
    setState(() {});
  }

  void _startListening() async {
    await speech.listen(
      onResult: _onSpeechResult,
      localeId: 'en_US',
    );
    setState(() {});
  }

  void _stopListening() async {
    await speech.stop();
    setState(() {});
  }

  void _onSpeechResult(result) {
    setState(() {
      recognizedSpeech = "${result.recognizedWords}".trim().toLowerCase();
      if (recognizedSpeech == _exercise.trim().toLowerCase()) {
        match = true;
        userPoint = (userPoint + widget.exercise[widget.index].mark) as int;
      } else {
        match = false;
      }
    });

    if (speech.isNotListening || speech.lastStatus == 'done') {
      resultDialog(context, match);
    }
  }

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
            const UserInfoRow(),
            ExerciseContent(exercise: _exercise),
            ListeningState(speech: speech, speechEnabled: _speechEnabled),
            // Text(recognizedSpeech),   // For showing the result on the screen
            const SizedBox(
              height: 15,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  speech.isListening ? _stopListening() : _startListening();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.height * 0.09,
                  padding: const EdgeInsets.symmetric(vertical: 17),
                  decoration: BoxDecoration(
                    color:
                        // ignore: unrelated_type_equality_checks
                        speech.isNotListening
                            ? const Color(0xFFFDEA9D)
                            : Colors.grey,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Text(
                    "Start Speaking 🎙️",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'TiltNeon',
                      color: Colors.white,
                      shadows: [
                        BoxShadow(
                          color: Color(0xFF434343),
                          spreadRadius: 2,
                          blurRadius: 7,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
