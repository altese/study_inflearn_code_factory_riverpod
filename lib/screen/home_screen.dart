import 'package:flutter/material.dart';
import 'package:inflearn_code_factory_riverpod/layout/default_layout.dart';
import 'package:inflearn_code_factory_riverpod/screen/state_provider_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaulLayout(
      title: 'Home Screen',
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const StateProviderScreen(),
                ),
              );
            },
            child: const Text('StateProvider'),
          )
        ],
      ),
    );
  }
}
