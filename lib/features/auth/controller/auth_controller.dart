import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/legacy.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, User?>((ref) {
  return AuthController();
});

class AuthController extends StateNotifier<User?> {
  AuthController() : super(FirebaseAuth.instance.currentUser);

  final _auth = FirebaseAuth.instance;

  Future<void> register(String email, String password) async {
    final cred = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    state = cred.user;
  }

  Future<void> login(String email, String password) async {
    final cred = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    state = cred.user;
  }

  Future<void> logout() async {
    await _auth.signOut();
    state = null;
  }
}