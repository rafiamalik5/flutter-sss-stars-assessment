import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Import your screens
import '../../features/auth/screens/register_screen.dart';
import '../../features/home/screens/home_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const RegisterScreen(), // you can later create LoginScreen
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
