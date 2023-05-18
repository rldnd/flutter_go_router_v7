import 'package:flutter/material.dart';
import 'package:flutter_go_router_v7/screen/first_screen.dart';
import 'package:flutter_go_router_v7/screen/home_screen.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App();

  GoRouter get _router => GoRouter(
        initialLocation: '/',
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => HomeScreen(),
            routes: [
              GoRoute(
                path: 'first',
                builder: (context, state) => FirstScreen(),
              ),
            ],
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
