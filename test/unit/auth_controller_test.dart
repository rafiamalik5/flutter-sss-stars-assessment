import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_app/features/auth/providers/auth_provider.dart';

void main() {
  test('AuthController registers a user', () async {
    final container = ProviderContainer();
    final authController = container.read(authProvider.notifier);

    // replace with mock Firebase if needed
    await authController.register('test@gmail.com', 'password123');
    final user = container.read(authProvider);
    expect(user?.email, 'test@gmail.com');
  });
}
