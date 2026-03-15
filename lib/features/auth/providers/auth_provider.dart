import 'package:flutter_riverpod/flutter_riverpod.dart';

// Dummy User class
class User {
  final String email;
  final String username;

  User({required this.email, required this.username});
}

// AuthController using StateNotifier
class AuthController extends StateNotifier<User?> {
  AuthController() : super(null);

  // Example: register user
  void register(String email, String username) {
    state = User(email: email, username: username);
  }

  // Example: logout
  void logout() {
    state = null;
  }
}

// Provider
final authProvider = StateNotifierProvider<AuthController, User?>(
  (ref) => AuthController(),
);
