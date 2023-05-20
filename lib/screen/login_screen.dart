import 'package:flutter/material.dart';
import 'package:flutter_go_router_v7/layout/default_layout.dart';
import 'package:flutter_go_router_v7/provider/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {
              ref.read(userProvider.notifier).login(name: 'ㅋㅋ');
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
