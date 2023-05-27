import 'package:flutter_go_router_v7/screen/first_basic_screen.dart';
import 'package:flutter_go_router_v7/screen/root_screen.dart';
import 'package:flutter_go_router_v7/screen/second_named_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => RootScreen(),
      routes: [
        GoRoute(
          path: 'basic',
          builder: (context, state) => FirstBasicScreen(),
        ),
        GoRoute(
          path: 'named',
          name: 'named_screen',
          builder: (context, state) => SecondNamedScreen(),
        )
      ],
    ),
  ],
);
