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
    "PELVIC MOVEMENT\nPage 12",
    "BRIDGE\nPage 14",
    "SHOULDER BRIDGE\nPage 16",
    "EXTENSION\nPage 18",
    "QUADRUPED\nPage 20",
    "ARM CIRCLE\nPage 22",
    "OPENING\nPage 25",
    "CORE EXERCISE TABLETOP\nPage 27",
    "CORE EXERCISE FROG POSITION\nPage 30",
    "CORE EXERCISE PLANK\nPage 32",
    "HUNDRED\nPage 34",
    "SINGLE LEG STRETCH\nPage 36",
    "DOUBLE LEG STRETCH\nPage 38",
    "CRISS CROSS\nPage 40",
    "SINGLE LEG CIRCLE\nPage 42",
    "SPINE STRETCH FORWARD\nPage 44",
    "ROLL UP\nPage 46",
    "SCISSORS\nPage 48",
    "SIDE BRIDGE\nPage 50",
    "ROLLING LIKE A BALL\nPage 51",
    "SEAL\nPage 53",
    "OPEN LEG ROCKER\nPage 55",
    "TEASER\nPage 57",
    "SWIMMING\nPage 59",
    "SWAN\nPage 61",
    "LEG EXTENSION\nPage 63",
    "FROG SQUEEZE\nPage 65",
    "MERMAID\nPage 67",
    "SAW\nPage 69",
    "THORACIC ROTATION\nPage 71",
    "JACK KNIFE\nPage 73",
    "HIP CIRCLE\nPage 75",
    "KNEELING SIDE KICK\nPage 77",
    "SIDE LEG FRONT&BACK\nPage 79",
    "SIDE LEG UP&DOWN\nPage 81",
    "SIDE LEG CLAM\nPage 83"
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
