import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class ListeningState extends StatelessWidget {
  const ListeningState({
    super.key,
    required this.speech,
    required bool speechEnabled,
  }) : _speechEnabled = speechEnabled;

  final stt.SpeechToText speech;
  final bool _speechEnabled;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        speech.isListening
            ? "listening..."
            : _speechEnabled
                ? "Tap the microphone to start listening..."
                : "Speech not recognized",
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          fontFamily: 'TiltNeon',
          color: Color(0xFF7D9C80),
        ),
      ),
    );
  }
}

