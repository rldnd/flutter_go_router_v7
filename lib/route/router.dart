import 'package:flutter_go_router_v7/screen/fifth_pop_return_screen.dart';
import 'package:flutter_go_router_v7/screen/first_basic_screen.dart';
import 'package:flutter_go_router_v7/screen/forth_pop_base_screen.dart';
import 'package:flutter_go_router_v7/screen/root_screen.dart';
import 'package:flutter_go_router_v7/screen/second_named_screen.dart';
import 'package:flutter_go_router_v7/screen/sixth_path_param_screen.dart';
import 'package:flutter_go_router_v7/screen/third_push_screen.dart';
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
        ),
        GoRoute(
          path: 'push',
          builder: (context, state) => ThirdPushScreen(),
        ),
        GoRoute(
          path: 'pop',
          builder: (context, state) => ForthPopBaseScreen(),
          routes: [
            GoRoute(
              path: 'return',
              builder: (context, state) => FifthPopReturnScreen(),
            ),
          ],
        ),
        GoRoute(
          path: 'path_param/:id',
          builder: (context, state) => PathParamScreen(),
          routes: [
            GoRoute(
              path: ':name',
              builder: (context, state) => PathParamScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
