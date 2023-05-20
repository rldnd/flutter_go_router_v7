import 'package:flutter/material.dart';
import 'package:flutter_go_router_v7/layout/default_layout.dart';
import 'package:flutter_go_router_v7/screen/third_screen.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: const Text('Screen THIRD (GO)'),
          ),
        ],
      ),
    );
  }
}
