import 'package:flutter/material.dart';
import 'package:flutter_go_router_v7/layout/default_layout.dart';
import 'package:go_router/go_router.dart';

class QueryParameterScreen extends StatelessWidget {
  const QueryParameterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          Text('query: ${GoRouterState.of(context).queryParameters}'),
          ElevatedButton(
            onPressed: () {
              context.push(
                Uri(
                  path: '/query_param',
                  queryParameters: {'name': 'rldnd', 'age': '32'},
                ).toString(),
              );
            },
            child: Text('Query parameter screen'),
          ),
        ],
      ),
    );
  }
}
