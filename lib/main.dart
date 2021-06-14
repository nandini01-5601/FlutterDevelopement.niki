import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  // This widget is the root of your application.

  void playSound(int noteNumber) {
    final player = AudioCache();
    player.play('note$noteNumber.wav');
  }

  Expanded buildkey({Color color , int noteNumber}) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          playSound(noteNumber);
        },
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget> [
              buildkey(color: Colors.red, noteNumber: 1),
              buildkey(color: Colors.orange, noteNumber: 2),
              buildkey(color: Colors.yellow, noteNumber: 3),
              buildkey(color: Colors.green, noteNumber: 4),
              buildkey(color: Colors.teal, noteNumber: 5),
              buildkey(color: Colors.blue, noteNumber: 6),
              buildkey(color: Colors.purple, noteNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}