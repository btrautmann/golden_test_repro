import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ElevatedButton', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData.light(useMaterial3: false),
        home: Scaffold(
          body: Center(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  const Color(0xFF2196F3),
                ),
                foregroundColor: WidgetStateProperty.all(
                  const Color(0xFFFFFFFF),
                ),
                shadowColor: WidgetStateProperty.all(
                  const Color(0xFFFF0000),
                ),
                surfaceTintColor: WidgetStateProperty.all(
                  const Color(0xFF00FF00),
                ),
                overlayColor: WidgetStateProperty.all(
                  const Color(0xFF0000FF),
                ),
              ),
              onPressed: () {},
              onLongPress: () {},
              child: const Text('button'),
            ),
          ),
        ),
      ),
    );

    final gesture = await tester.startGesture(
      tester.getCenter(
        find.byType(ElevatedButton),
        warnIfMissed: true,
        callee: 'tester',
      ),
    );

    await tester.pump(const Duration(milliseconds: 300));
    await tester.pump(const Duration(milliseconds: 300));

    expect(
      find.byType(MaterialApp),
      matchesGoldenFile('elevated_button.png'),
    );

    await gesture.up();
  });
}
