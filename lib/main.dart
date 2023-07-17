import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: SafeArea(
            child: Container(
          child: Column(
            children: [
              Note(no: 1, note: "C", color: Colors.redAccent),
              Note(no: 2, note: "D", color: Colors.orangeAccent),
              Note(no: 3, note: "E", color: Colors.yellowAccent),
              Note(no: 4, note: "F", color: Colors.greenAccent),
              Note(no: 5, note: "G", color: Colors.tealAccent),
              Note(no: 6, note: "A", color: Colors.blueAccent),
              Note(no: 7, note: "B", color: Colors.purpleAccent),
            ],
          ),
        )),
      ),
    );
  }
}

class Note extends StatelessWidget {
  int no;
  String note;
  Color color;
  Note({super.key, required this.no, required this.note, required this.color});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        final player = AudioPlayer();
        player.play(AssetSource('note$no.wav'));
      },
      child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 85,
          color: color,
          child: Text(
            note,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          )),
    );
  }
}
