import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;

final firebaseAuthProvider = Provider<fb.FirebaseAuth>((ref) => fb.FirebaseAuth.instance);

class AuthController extends StateNotifier<fb.User?> {
  final fb.FirebaseAuth _auth;
  AuthController(this._auth) : super(_auth.currentUser);

  // Register user
  Future<void> register(String email, String password) async {
    try {
      final credential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      state = credential.user;
    } catch (e) {
      // handle errors
    }
  }

  // Login user
  Future<void> login(String email, String password) async {
    try {
      final credential = await _auth
          .signInWithEmailAndPassword(email: email, password: password);
      state = credential.user;
    } catch (e) {
      // handle errors
    }
  }

  // Logout
  Future<void> logout() async {
    await _auth.signOut();
    state = null;
  }
}

final authProvider = StateNotifierProvider<AuthController, fb.User?>(
  (ref) => AuthController(ref.watch(firebaseAuthProvider)),
);
