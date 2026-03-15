import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider); // watch the auth state

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Update the state
            ref.read(authProvider.notifier).register('test@mail.com', 'Rafia');
            context.go('/home');
          },
          child: const Text('Register and Go Home'),
        ),
      ),
    );
  }
}
