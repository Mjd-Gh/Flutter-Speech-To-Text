import 'package:flutter/material.dart';
import 'package:speech_recogntion/main.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechToTextSceen extends StatefulWidget {
  const SpeechToTextSceen({super.key});

  @override
  State<SpeechToTextSceen> createState() => speechSceenState();
}

// ignore: camel_case_types
class speechSceenState extends State<SpeechToTextSceen> {
  final stt.SpeechToText speech = stt.SpeechToText();
  bool _speechEnabled = false;
  String recognizedSpeech = "";
  String? exercise = lessonsList![2].exercise?.trim().toLowerCase();
  bool match = false;

  @override
  void initState() {
    super.initState();
    initSpeech();
  }

  void initSpeech() async {
    _speechEnabled = await speech.initialize();
    setState(() {});
  }

  void _startListening() async {
    await speech.listen(onResult: _onSpeechResult, localeId: 'en_US');
    setState(() {});
  }

  void _stopListening() async {
    await speech.stop();
    setState(() {});
  }

  void _onSpeechResult(result) {
    setState(() {
      recognizedSpeech = "${result.recognizedWords}".trim().toLowerCase();
      if (recognizedSpeech.trim().toLowerCase() ==
          exercise?.trim().toLowerCase()) {
        match = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print(
        "////////////////////////////////////${recognizedSpeech.toLowerCase()}");
    print("////////////////////////////////////${exercise?.toLowerCase()}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'Speech Demo',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Text(
                speech.isListening
                    ? "listening..."
                    : _speechEnabled
                        ? "Tap the microphone to start listening..."
                        : "Speech not _speechEnabled",
                style: const TextStyle(fontSize: 20.0),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Text(
                  recognizedSpeech,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            Text(match ? "True answer" : "Wrong answer"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: speech.isListening ? _stopListening : _startListening,
        tooltip: 'Listen',
        backgroundColor: Colors.red,
        child: Icon(
          speech.isNotListening ? Icons.mic_off : Icons.mic,
          color: Colors.white,
        ),
      ),
    );
  }
}
