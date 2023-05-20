import 'package:flutter/material.dart';
import 'package:flutter_go_router_v7/layout/default_layout.dart';
import 'package:go_router/go_router.dart';

class ErrorScreen extends StatelessWidget {
  final String error;

  const ErrorScreen({
    super.key,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Column(
        children: [
          Text(error),
          ElevatedButton(
            onPressed: () {
              context.go('/');
            },
            child: Text('홈으로'),
          ),
        ],
      ),
    );
  }
}
