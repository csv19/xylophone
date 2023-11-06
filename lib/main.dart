// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  AudioCache audioCache = AudioCache();

  void playNote(int note) {
    // audioCache.play('/assets/audios/note$note.wav');
    final player = AudioPlayer();
    player.play(AssetSource('audios/note$note.wav'));
  }

  Widget buildKey(
      {required Color colorKey, required int note, required String notas}) {
    return Expanded(
      child: Container(
        color: colorKey,
        child: TextButton(
          onPressed: () {
            playNote(note);
          },
          child: Text(notas,
              style: TextStyle(fontSize: 25.0, color: Colors.white)),
        ),
      ),
    );
  }

  List<Map<String, dynamic>> keyData = [
    {
      'colorKey': Colors.pink,
      'note': 1,
      'notas': "Do",
    },
    {
      'colorKey': Colors.indigo,
      'note': 2,
      'notas': "Re",
    },
    {
      'colorKey': Colors.green,
      'note': 3,
      'notas': "Mi",
    },
    {
      'colorKey': Colors.yellow,
      'note': 4,
      'notas': "Fa",
    },
    {
      'colorKey': Colors.orange,
      'note': 5,
      'notas': "Sol",
    },
    {
      'colorKey': Colors.brown,
      'note': 6,
      'notas': "La",
    },
    {
      'colorKey': Colors.blue,
      'note': 7,
      'notas': "Si",
    },
  ];
  List<Widget> data() {
    List<Widget> keyWidgets = keyData.map((data) {
      return buildKey(
        colorKey: data['colorKey'],
        note: data['note'],
        notas: data['notas'],
      );
    }).toList();

    return keyWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Xylophone"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: data(),
      ),
    );
  }
}
