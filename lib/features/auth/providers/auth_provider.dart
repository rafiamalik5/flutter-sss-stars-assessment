import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;

final firebaseAuthProvider = fb.FirebaseAuth.instance;

class AuthController extends StateNotifier<fb.User?> {
  AuthController() : super(fb.FirebaseAuth.instance.currentUser);

  // Register user
  Future<void> register(String email, String password) async {
    try {
      final credential = await fb.FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      state = credential.user;
    } catch (e) {
      // handle errors
      print('Firebase register error: $e');
    }
  }

  // Login user
  Future<void> login(String email, String password) async {
    try {
      final credential = await fb.FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      state = credential.user;
    } catch (e) {
      print('Firebase login error: $e');
    }
  }

  // Logout
  Future<void> logout() async {
    await fb.FirebaseAuth.instance.signOut();
    state = null;
  }
}

final authProvider = StateNotifierProvider<AuthController, fb.User?>(
  (ref) => AuthController(),
);