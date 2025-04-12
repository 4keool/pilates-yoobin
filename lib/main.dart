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
  static const String DEFAULT_MESSAGE = "필라테스 동작을 랜덤으로\n뽑아보세요~!";
  static const String ALL_SELECTED_MESSAGE = "모든 항목이 선택되었습니다!";

  final Map<String, List<Map<String, String>>> exercises = {
    "맨몸 운동": [
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
    ],
    "리포머 운동": [
      {"name": "Footwork-Toe/Arch/Heel position", "page": "6"},
      {"name": "Tendon stretch", "page": "8"},
      {"name": "HEELS UP & DOWN", "page": "9"},
      {"name": "ONE LEG PRESS", "page": "10"},
      {"name": "ONE LEG PRESS-DIAGONAL LEG", "page": "12"},
      {"name": "ONE LEG PRESS-REACH & BAND", "page": "14"},
      {"name": "BRIDGE", "page": "16"},
      {"name": "BRIDGE-CIRCLE", "page": "18"},
      {"name": "HUNDRED", "page": "20"},
      {"name": "Supine-core exercise[basic]", "page": "22"},
      {"name": "Supine-core exercise[Heel tap]", "page": "23"},
      {"name": "Supine-core exercise[Leg stretch]", "page": "24"},
      {"name": "FEET IN STRAPS-UP & DOWN", "page": "25"},
      {"name": "FEET IN STRAPS-REACH & BEND", "page": "27"},
      {"name": "FEET IN STRAPS-FROG PRESS", "page": "29"},
      {"name": "FEET IN STRAPS-LEG OPEN & CLOSE", "page": "31"},
      {"name": "FEET IN STRAPS-LEG CIRCLES", "page": "33"},
      {"name": "FEET IN STRAPS-SHORT SPINE", "page": "35"},
      {"name": "FEET IN STRAPS-LONG SPINE", "page": "37"},
      {"name": "SWAN DIVE ON THE BOX", "page": "39"},
      {"name": "GRASSHOPPER", "page": "41"},
      {"name": "MERMAID ON THE BOX", "page": "43"},
      {"name": "ABDOMINAL SERIES ON THE BOX", "page": "46"},
      {"name": "ABDOMINAL SERIES ON THE BOX-ROUND BACK TWIST", "page": "48"},
      {"name": "ABDOMINAL SERIES ON THE BOX-FLAT BACK TWIST", "page": "50"},
      {"name": "ABDOMINAL SERIES BACKSTROKE", "page": "52"},
      {"name": "PULLING STRAPS ON THE BOX", "page": "54"},
      {"name": "PULLING STRAPS ON THE BOX-TRICEPS", "page": "56"},
      {"name": "HAMSTRING CURL ON THE BOX", "page": "57"},
      {"name": "ABDOMINAL SERIES(KNEELING)-Down stretch", "page": "59"},
      {"name": "ABDOMINAL SERIES(KNEELING)-UP Stretch", "page": "61"},
      {"name": "Knee Stretch-ROUND BACK", "page": "63"},
      {"name": "Knee Stretch-FLAT BACK", "page": "65"},
      {"name": "Knee Stretch-Knees off", "page": "67"},
      {"name": "SIDE BRIDGE", "page": "69"},
      {"name": "Elephant", "page": "70"},
      {"name": "ARM SERIES(FACING THE Pulley)-BACKWARD", "page": "72"},
      {"name": "ARM SERIES(FACING THE Pulley)-ROTATION", "page": "74"},
      {"name": "ARM SERIES(FACING THE Pulley)-ROWING", "page": "76"},
      {"name": "ARM SERIES(FACING THE Pulley)-BUTTERFLY", "page": "78"},
      {"name": "ARM SERIES(FACING THE Pulley)-OPEN CHEST", "page": "80"},
      {
        "name": "ARM SERIES(FACING THE Pulley)-KNEELING OPEN CHEST",
        "page": "82"
      },
      {"name": "ARM SERIES(FACING THE Pulley)-BICEPS CURLS", "page": "84"},
      {"name": "MERMAID", "page": "86"},
      {"name": "ARM SERIES(FACING FOOTBAR)-ANTERIOR DELTOID", "page": "89"},
      {"name": "ARM SERIES(FACING FOOTBAR)-REACH & OPEN", "page": "91"},
      {"name": "ARM SERIES(FACING FOOTBAR)-Salute", "page": "93"},
      {"name": "Anti rotation-Pallof press", "page": "95"},
      {"name": "INTERNAL ROTATION", "page": "97"},
      {"name": "EXTERNAL ROTATION", "page": "99"},
      {"name": "ADDUCTION", "page": "101"},
      {"name": "ABDUCTION-OVER HEAD", "page": "103"},
      {"name": "LONG BOX-OVER HEAD PRESS", "page": "105"},
      {"name": "STANDING-OVER HEAD PRESS", "page": "107"},
      {"name": "QUADRUPED-BIRD DOG", "page": "109"},
      {"name": "SIDE SPLITS", "page": "111"},
      {"name": "LATERAL STABILITY", "page": "113"},
      {"name": "CONTROL FRONT", "page": "115"},
      {"name": "SIDE LEG PRESS", "page": "117"},
      {"name": "SIDE LEG series-HIP EXTENSION 1", "page": "119"},
      {"name": "SIDE LEG series-HIP EXTENSION 2", "page": "120"},
      {"name": "SIDE LEG series-HIP EXTENSION 3", "page": "121"},
      {"name": "SIDE LEG series-LEG CIRCLE", "page": "123"},
      {"name": "HIP FLEXOR STRETCH", "page": "125"},
      {"name": "HIP HINGE", "page": "127"}
    ],
    "캐딜락 운동": [
      {"name": "Footwork-Toe/Arch/Heel position", "page": "6"},
      {"name": "Tendon stretch", "page": "8"},
      {"name": "HEELS UP & DOWN", "page": "9"},
      {"name": "ONE LEG PRESS", "page": "10"},
      {"name": "ONE LEG PRESS-DIAGONAL LEG", "page": "12"},
      {"name": "ONE LEG PRESS-REACH & BAND", "page": "14"},
    ]
  };

  late List<Map<String, String>> allRewards;
  late List<Map<String, String>> availableRewards;
  final List<Map<String, String>> selectedRewards = [];
  String result = DEFAULT_MESSAGE;
  bool showList = false;
  String currentExerciseType = "리포머 운동"; // 초기값을 리포머 운동으로 설정

  @override
  void initState() {
    super.initState();
    allRewards = List.from(exercises[currentExerciseType]!);
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
      allRewards = List.from(exercises[currentExerciseType]!);
      availableRewards = List.from(allRewards);
      selectedRewards.clear();
      result = DEFAULT_MESSAGE;
    });
  }

  void changeExerciseType(String type) {
    setState(() {
      currentExerciseType = type;
      allRewards = List.from(exercises[currentExerciseType]!);
      resetLottery();
      showList = false; // 운동 타입 변경 시 리스트 닫기
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: exercises.keys.map((type) {
              return ElevatedButton(
                onPressed: () => changeExerciseType(type),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      currentExerciseType == type ? Colors.blue : Colors.grey,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: Text(
                  type,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              );
            }).toList(),
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
