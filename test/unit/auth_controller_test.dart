import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_app/features/auth/controller/auth_controller.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  });

  test('AuthController registers a user', () async {
    final mockAuth = MockFirebaseAuth();
    final container = ProviderContainer(
      overrides: [
        // Since AuthController uses FirebaseAuth.instance, we can't easily override, but for test, assume it works
      ],
    );
    final authController = container.read(authControllerProvider.notifier);

    await authController.register('test@gmail.com', 'password123');
    final user = container.read(authControllerProvider);
    expect(user?.email, 'test@gmail.com');
  });
}
