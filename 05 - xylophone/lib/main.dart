import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(String sound) {
    final player = AudioCache();
    player.play(sound);
  }

  Widget buildKey({@required int id, @required Color color}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
        ),
        onPressed: () {
          playSound("note$id.wav");
        },
        child: null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(id: 1, color: Colors.red),
              buildKey(id: 2, color: Colors.orange),
              buildKey(id: 3, color: Colors.yellow),
              buildKey(id: 4, color: Colors.green),
              buildKey(id: 5, color: Colors.teal),
              buildKey(id: 6, color: Colors.blue),
              buildKey(id: 7, color: Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
