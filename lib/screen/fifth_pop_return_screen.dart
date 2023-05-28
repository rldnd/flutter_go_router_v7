import 'package:flutter/material.dart';
import 'package:flutter_go_router_v7/layout/default_layout.dart';
import 'package:go_router/go_router.dart';

class FifthPopReturnScreen extends StatelessWidget {
  const FifthPopReturnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              context.pop('test');
            },
            child: Text('pop'),
          ),
        ],
      ),
    );
  }
}
