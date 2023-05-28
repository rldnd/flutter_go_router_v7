import 'package:flutter/material.dart';
import 'package:flutter_go_router_v7/screen/eighth_nested_child_screen.dart';
import 'package:flutter_go_router_v7/screen/eighth_nested_screen.dart';
import 'package:flutter_go_router_v7/screen/eleventh_error_screen.dart';
import 'package:flutter_go_router_v7/screen/fifth_pop_return_screen.dart';
import 'package:flutter_go_router_v7/screen/first_basic_screen.dart';
import 'package:flutter_go_router_v7/screen/forth_pop_base_screen.dart';
import 'package:flutter_go_router_v7/screen/nineth_login_screen.dart';
import 'package:flutter_go_router_v7/screen/nineth_private_screen.dart';
import 'package:flutter_go_router_v7/screen/root_screen.dart';
import 'package:flutter_go_router_v7/screen/second_named_screen.dart';
import 'package:flutter_go_router_v7/screen/seventh_query_parameter.dart';
import 'package:flutter_go_router_v7/screen/sixth_path_param_screen.dart';
import 'package:flutter_go_router_v7/screen/tenth_transition_screen_1.dart';
import 'package:flutter_go_router_v7/screen/tenth_transition_screen_2.dart';
import 'package:flutter_go_router_v7/screen/third_push_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  errorBuilder: (context, state) => ErrorScreen(error: state.error.toString()),
  redirect: (context, state) {
    if (state.location == '/login/private' && !authState) {
      return '/login';
    }

    return null;
  },
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
        GoRoute(
          path: 'query_param',
          builder: (context, state) => QueryParameterScreen(),
        ),
        ShellRoute(
          builder: (context, state, child) {
            return NestedScreen(
              child: child,
            );
          },
          routes: [
            GoRoute(
              path: 'nested/a',
              builder: (context, state) => NestedChildScreen(
                routeName: '/nested/a',
              ),
            ),
            GoRoute(
              path: 'nested/b',
              builder: (context, state) => NestedChildScreen(
                routeName: '/nested/b',
              ),
            ),
            GoRoute(
              path: 'nested/c',
              builder: (context, state) => NestedChildScreen(
                routeName: '/nested/c',
              ),
            ),
          ],
        ),
        GoRoute(
          path: 'login',
          builder: (context, state) => LoginScreen(),
          routes: [
            GoRoute(
              path: 'private',
              builder: (context, state) => PrivateScreen(),
            ),
          ],
        ),
        GoRoute(
          path: 'login2',
          builder: (context, state) => LoginScreen(),
          routes: [
            GoRoute(
              path: 'private',
              builder: (context, state) => PrivateScreen(),
              redirect: (context, state) {
                if (!authState) return '/login2';
                return null;
              },
            ),
          ],
        ),
        GoRoute(
          path: 'transition',
          builder: (context, state) => TransitionScreenOne(),
          routes: [
            GoRoute(
              path: 'detail',
              pageBuilder: (context, state) => CustomTransitionPage(
                transitionDuration: Duration(seconds: 3),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                  // return ScaleTransition(
                  //   scale: animation,
                  //   child: child,
                  // );
                  // return RotationTransition(
                  //   turns: animation,
                  //   child: child,
                  // );
                },
                child: TransitionScreenTwo(),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
