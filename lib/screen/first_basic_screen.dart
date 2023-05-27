import 'package:flutter/material.dart';
import 'package:flutter_go_router_v7/layout/default_layout.dart';

class FirstBasicScreen extends StatelessWidget {
  const FirstBasicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      body: Center(
        child: Text('First Basic Screen'),
      ),
    );
  }
}
