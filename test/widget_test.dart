// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pilates/main.dart';

void main() {
  testWidgets('초기 화면에 안내 메시지가 표시되는지 테스트', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(LotteryApp());

    // Verify that our initial message is displayed
    expect(find.text('필라테스 동작을 랜덤으로 뽑아보세요~!'), findsOneWidget);
  });
}
