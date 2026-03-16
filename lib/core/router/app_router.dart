import 'package:go_router/go_router.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/auth/screens/register_screen.dart' hide LoginScreen;
import '../../features/home/screens/home_screen.dart';

final router = GoRouter(
  routes: [

    GoRoute(
      path: '/',
      builder: (context, state) => LoginScreen(),
    ),

    GoRoute(
      path: '/register',
      builder: (context, state) => RegisterScreen(),
    ),

    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),

  ],
);