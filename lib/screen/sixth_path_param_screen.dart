import 'package:flutter/material.dart';
import 'package:flutter_go_router_v7/layout/default_layout.dart';
import 'package:go_router/go_router.dart';

class PathParamScreen extends StatelessWidget {
  const PathParamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          Text('Path param: ${GoRouterState.of(context).pathParameters['id']}'),
          Text(
            'Path param: ${GoRouterState.of(context).pathParameters['name']}',
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/path_param/456/test');
            },
            child: Text('Path param screen'),
          ),
        ],
      ),
    );
  }
}
