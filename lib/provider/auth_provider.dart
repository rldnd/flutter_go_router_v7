import 'package:flutter/material.dart';
import 'package:flutter_go_router_v7/model/user_model.dart';
import 'package:flutter_go_router_v7/screen/error_screen.dart';
import 'package:flutter_go_router_v7/screen/first_screen.dart';
import 'package:flutter_go_router_v7/screen/home_screen.dart';
import 'package:flutter_go_router_v7/screen/login_screen.dart';
import 'package:flutter_go_router_v7/screen/second_screen.dart';
import 'package:flutter_go_router_v7/screen/third_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
GoRouter router(RouterRef ref) {
  final authStateProvider = AuthNotifier(ref: ref);

  return GoRouter(
    initialLocation: '/',
    errorBuilder: (context, state) {
      return ErrorScreen(error: state.error.toString());
    },
    routes: authStateProvider._routes,
    redirect: (_, state) => authStateProvider._redirectLogic(state),
    refreshListenable: authStateProvider,
  );
}

class AuthNotifier extends ChangeNotifier {
  final Ref ref;

  AuthNotifier({required this.ref}) {
    ref.listen(userProvider, (previous, next) {
      if (previous != next) {
        notifyListeners();
      }
    });
  }

  String? _redirectLogic(GoRouterState state) {
    final user = ref.read(userProvider);
    final loggingIn = state.location == '/login';

    if (user == null) {
      return loggingIn ? null : '/login';
    }

    if (loggingIn) return '/';

    return null;
  }

  List<GoRoute> get _routes => [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
              path: 'first',
              builder: (context, state) => const FirstScreen(),
              routes: [
                GoRoute(
                  path: 'second',
                  builder: (context, state) => const SecondScreen(),
                  routes: [
                    GoRoute(
                      path: 'third',
                      name: ThirdScreen.routeName,
                      builder: (context, state) => const ThirdScreen(),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginScreen(),
        )
      ];
}

@Riverpod(keepAlive: true)
class User extends _$User {
  @override
  UserModel? build() {
    return null;
  }

  login({required String name}) {
    state = UserModel(name: name);
  }

  logout() {
    state = null;
  }
}
