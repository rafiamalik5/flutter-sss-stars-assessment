import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_app/features/auth/providers/auth_provider.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';

void main() {
  test('AuthController registers a user', () async {
    final mockAuth = MockFirebaseAuth();
    final container = ProviderContainer(
      overrides: [
        firebaseAuthProvider.overrideWithValue(mockAuth),
      ],
    );
    final authController = container.read(authProvider.notifier);

    await authController.register('test@gmail.com', 'password123');
    final user = container.read(authProvider);
    expect(user?.email, 'test@gmail.com');
  });
}
