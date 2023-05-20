import 'package:flutter/material.dart';
import 'package:flutter_go_router_v7/layout/default_layout.dart';
import 'package:flutter_go_router_v7/provider/auth_provider.dart';
import 'package:flutter_go_router_v7/screen/third_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {
              context.go('/first');
            },
            child: const Text('Screen FIRST (GO)'),
          ),
          ElevatedButton(
            onPressed: () {
              context.goNamed(ThirdScreen.routeName);
            },
            child: const Text('Screen THIRD (GO)'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('error');
            },
            child: const Text('Screen ERROR (GO)'),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(userProvider.notifier).logout();
            },
            child: const Text('LOGOUT'),
          ),
        ],
      ),
    );
  }
}
