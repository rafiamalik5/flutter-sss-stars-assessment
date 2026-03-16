import 'package:flutter_test/flutter_test.dart';

bool isValidEmail(String email) {
  return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
      .hasMatch(email);
}

void main() {
  test('email validation works', () {
    expect(isValidEmail("test@gmail.com"), true);
    expect(isValidEmail("invalid-email"), false);
  });
}