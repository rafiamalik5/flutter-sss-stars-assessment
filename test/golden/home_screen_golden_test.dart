import 'package:flutter_test_app/features/home/screens/home_screen.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void main() {
  testGoldens('HomeScreen golden test', (tester) async {
    await tester.pumpWidgetBuilder(
      const ProviderScope(child: MaterialApp(home: HomeScreen())),
      surfaceSize: const Size(400, 800),
    );
    await screenMatchesGolden(tester, 'home_screen_golden');
  });
}
