import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(LotteryApp());
}

class LotteryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LotteryScreen(),
    );
  }
}

class LotteryScreen extends StatefulWidget {
  @override
  _LotteryScreenState createState() => _LotteryScreenState();
}

class _LotteryScreenState extends State<LotteryScreen> {
  List<String> rewards = [
    "PELVIC MOVEMENT - Page 12",
    "BRIDGE - Page 14",
    "SHOULDER BRIDGE - Page 16",
    "EXTENSION - Page 18",
    "QUADRUPED - Page 20",
    "ARM CIRCLE - Page 22",
    "OPENING - Page 25",
    "CORE EXERCISE-TABLETOP - Page 27",
    "CORE EXERCISE-FROG POSITION - Page 30",
    "CORE EXERCISE-PLANK - Page 32",
    "HUNDRED - Page 34",
    "SINGLE LEG STRETCH - Page 36",
    "DOUBLE LEG STRETCH - Page 38",
    "CRISS CROSS - Page 40",
    "SINGLE LEG CIRCLE - Page 42",
    "SPINE STRETCH FORWARD - Page 44",
    "ROLL UP - Page 46",
    "SCISSORS - Page 48",
    "SIDE BRIDGE - Page 50",
    "ROLLING LIKE A BALL - Page 51",
    "SEAL - Page 53",
    "OPEN LEG ROCKER - Page 55",
    "TEASER - Page 57",
    "SWIMMING - Page 59",
    "SWAN - Page 61",
    "LEG EXTENSION - Page 63",
    "FROG SQUEEZE - Page 65",
    "MERMAID - Page 67",
    "SAW - Page 69",
    "THORACIC ROTATION - Page 71",
    "JACK KNIFE - Page 73",
    "HIP CIRCLE - Page 75",
    "KNEELING SIDE KICK - Page 77",
    "SIDE LEG FRONT&BACK - Page 79",
    "SIDE LEG UP&DOWN - Page 81",
    "SIDE LEG-CLAM - Page 83"
  ];

  String result = "필라테스 동작을 랜덤으로 뽑아보세요~!";

  void drawLottery() {
    setState(() {
      int randomIndex = Random().nextInt(rewards.length);
      result = rewards[randomIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[900],
      appBar: AppBar(
        title: Text("동작 랜덤 뽑기"),
        backgroundColor: Colors.brown[800],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                result,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: drawLottery,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: Text("뽑기", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
