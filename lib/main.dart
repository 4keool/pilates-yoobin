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
  List<Map<String, String>> allRewards = [
    {"name": "PELVIC MOVEMENT", "page": "12"},
    {"name": "BRIDGE", "page": "14"},
    {"name": "SHOULDER BRIDGE", "page": "16"},
    {"name": "EXTENSION", "page": "18"},
    {"name": "QUADRUPED", "page": "20"},
    {"name": "ARM CIRCLE", "page": "22"},
    {"name": "OPENING", "page": "25"},
    {"name": "CORE EXERCISE-TABLETOP", "page": "27"},
    {"name": "CORE EXERCISE-FROG POSITION", "page": "30"},
    {"name": "CORE EXERCISE-PLANK", "page": "32"},
    {"name": "HUNDRED", "page": "34"},
    {"name": "SINGLE LEG STRETCH", "page": "36"},
    {"name": "DOUBLE LEG STRETCH", "page": "38"},
    {"name": "CRISS CROSS", "page": "40"},
    {"name": "SINGLE LEG CIRCLE", "page": "42"},
    {"name": "SPINE STRETCH FORWARD", "page": "44"},
    {"name": "ROLL UP", "page": "46"},
    {"name": "SCISSORS", "page": "48"},
    {"name": "SIDE BRIDGE", "page": "50"},
    {"name": "ROLLING LIKE A BALL", "page": "51"},
    {"name": "SEAL", "page": "53"},
    {"name": "OPEN LEG ROCKER", "page": "55"},
    {"name": "TEASER", "page": "57"},
    {"name": "SWIMMING", "page": "59"},
    {"name": "SWAN", "page": "61"},
    {"name": "LEG EXTENSION", "page": "63"},
    {"name": "FROG SQUEEZE", "page": "65"},
    {"name": "MERMAID", "page": "67"},
    {"name": "SAW", "page": "69"},
    {"name": "THORACIC ROTATION", "page": "71"},
    {"name": "JACK KNIFE", "page": "73"},
    {"name": "HIP CIRCLE", "page": "75"},
    {"name": "KNEELING SIDE KICK", "page": "77"},
    {"name": "SIDE LEG FRONT&BACK", "page": "79"},
    {"name": "SIDE LEG UP&DOWN", "page": "81"},
    {"name": "SIDE LEG-CLAM", "page": "83"}
  ];

  List<Map<String, String>> availableRewards = [];
  List<Map<String, String>> selectedRewards = [];
  String result = "하루에 한 번! 행운의 기회를 잡으세요!";
  bool showList = false;

  @override
  void initState() {
    super.initState();
    availableRewards = List.from(allRewards);
  }

  void drawLottery() {
    if (availableRewards.isEmpty) {
      setState(() {
        result = "모든 항목이 선택되었습니다!";
      });
      return;
    }

    setState(() {
      int randomIndex = Random().nextInt(availableRewards.length);
      Map<String, String> chosen = availableRewards.removeAt(randomIndex);
      selectedRewards.add(chosen);
      result = "${chosen["name"]} - Page ${chosen["page"]}";
    });
  }

  void resetLottery() {
    setState(() {
      availableRewards = List.from(allRewards);
      selectedRewards.clear();
      result = "하루에 한 번! 행운의 기회를 잡으세요!";
      showList = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[900],
      appBar: AppBar(
        title: Text("랜덤 뽑기 이벤트"),
        backgroundColor: Colors.brown[800],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(horizontal: 20),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: drawLottery,
                child: Text("뽑기 시작"),
              ),
              ElevatedButton(
                onPressed: resetLottery,
                child: Text("초기화"),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                showList = !showList;
              });
            },
            child: Text(showList ? "리스트 숨기기" : "리스트 보기"),
          ),
          if (showList)
            Container(
              height: 200,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: allRewards.map((item) {
                    bool isSelected = selectedRewards.contains(item);
                    return Text(
                      isSelected
                          ? "\u0336${item["name"] ?? ''}"
                          : item["name"] ?? '',
                      style: TextStyle(
                        fontSize: 16,
                        decoration:
                            isSelected ? TextDecoration.lineThrough : null,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
