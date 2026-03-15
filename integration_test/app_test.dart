import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Register and go to home', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    final emailField = find.byType(TextField).first;
    final passwordField = find.byType(TextField).last;

    await tester.enterText(emailField, 'test@gmail.com');
    await tester.enterText(passwordField, 'password123');

    await tester.tap(find.text('Register'));
    await tester.pumpAndSettle();

    expect(find.text('Home'), findsOneWidget);
  });
}
