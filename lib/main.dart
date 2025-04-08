import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const LotteryApp());
}

class LotteryApp extends StatelessWidget {
  const LotteryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LotteryScreen(),
    );
  }
}

class LotteryScreen extends StatefulWidget {
  const LotteryScreen({super.key});

  @override
  _LotteryScreenState createState() => _LotteryScreenState();
}

class _LotteryScreenState extends State<LotteryScreen> {
  // 상수 정의
  static const String DEFAULT_MESSAGE = "필라테스 동작을 랜덤으로\n뽑아보세요~!";
  static const String ALL_SELECTED_MESSAGE = "모든 항목이 선택되었습니다!";

  final List<Map<String, String>> bodyweightExercises = [
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

  final List<Map<String, String>> equipmentExercises = [
    {"name": "REFORMER EXERCISE 1", "page": "80"},
    {"name": "CADILLAC EXERCISE 1", "page": "90"},
    {"name": "예제1", "page": "1"},
    {"name": "예제2", "page": "2"},
    {"name": "예제3", "page": "3"},
    {"name": "예제4", "page": "4"},
    {"name": "예제5", "page": "5"},
    {"name": "예제6", "page": "6"},
    {"name": "예제7", "page": "7"},
    {"name": "예제8", "page": "8"},
    {"name": "예제9", "page": "9"},
    {"name": "예제10", "page": "10"}
  ];

  late List<Map<String, String>> allRewards;
  late List<Map<String, String>> availableRewards;
  final List<Map<String, String>> selectedRewards = [];
  String result = DEFAULT_MESSAGE;
  bool showList = false;
  bool isBodyweight = false; // 초기값을 기구 운동으로 설정

  @override
  void initState() {
    super.initState();
    allRewards = List.from(equipmentExercises); // 초기값은 기구 운동
    availableRewards = List.from(allRewards);
  }

  bool get isDrawButtonEnabled =>
      availableRewards.isNotEmpty || result != ALL_SELECTED_MESSAGE;

  void drawLottery() {
    if (availableRewards.isEmpty) {
      setState(() {
        result = ALL_SELECTED_MESSAGE;
      });
      return;
    }

    setState(() {
      final randomIndex = Random().nextInt(availableRewards.length);
      final chosen = availableRewards.removeAt(randomIndex);
      selectedRewards.add(chosen);
      result = "${chosen["name"]}\nPage ${chosen["page"]}";
    });
  }

  void resetLottery() {
    setState(() {
      allRewards =
          List.from(isBodyweight ? bodyweightExercises : equipmentExercises);
      availableRewards = List.from(allRewards);
      selectedRewards.clear();
      result = DEFAULT_MESSAGE;
    });
  }

  void toggleExerciseType() {
    setState(() {
      isBodyweight = !isBodyweight;
      allRewards =
          List.from(isBodyweight ? bodyweightExercises : equipmentExercises);
      resetLottery();
      showList = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: toggleExerciseType,
            style: ElevatedButton.styleFrom(
              backgroundColor: isBodyweight ? Colors.blue : Colors.purple,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            child: Text(
              isBodyweight ? "맨몸 운동" : "기구 운동",
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              result,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: isDrawButtonEnabled ? drawLottery : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  disabledBackgroundColor: Colors.grey,
                ),
                child: const Text("뽑기", style: TextStyle(color: Colors.white)),
              ),
              ElevatedButton(
                onPressed: resetLottery,
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                child: const Text("초기화", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => setState(() => showList = !showList),
            child: Text(showList ? "리스트 숨기기" : "리스트 보기"),
          ),
          if (showList)
            Container(
              height: 200,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: allRewards.map((item) {
                    final isSelected = selectedRewards.contains(item);
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
