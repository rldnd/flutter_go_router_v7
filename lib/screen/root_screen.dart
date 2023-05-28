import 'package:flutter/material.dart';
import 'package:flutter_go_router_v7/layout/default_layout.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RootScreen extends ConsumerWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              context.go('/basic');
            },
            child: const Text('Go Basic'),
          ),
          ElevatedButton(
            onPressed: () {
              context.goNamed('named_screen');
            },
            child: const Text('Go Named'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/push');
            },
            child: const Text('Go Push'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/pop');
            },
            child: const Text('Go return'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/path_param/456');
            },
            child: const Text('Go path param'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/query_param');
            },
            child: const Text('Go Query Param'),
          ),
        ],
      ),
    );
  }
}
