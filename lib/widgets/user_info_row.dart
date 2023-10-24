import 'package:flutter/material.dart';
import 'package:speech_recogntion/main.dart';

class UserInfoRow extends StatefulWidget {
  const UserInfoRow({
    super.key,
  });

  @override
  State<UserInfoRow> createState() => UserInfoRowState();
}

class UserInfoRowState extends State<UserInfoRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "🧑🏻 Nasser",
            style: TextStyle(
              height: 1,
              fontSize: 27,
              fontWeight: FontWeight.bold,
              fontFamily: 'TiltNeon',
            ),
          ),
          Text(
            "⭐$userPoint",
            style: const TextStyle(
              height: 1,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: 'TiltNeon',
            ),
          ),
        ],
      ),
    );
  }
}
