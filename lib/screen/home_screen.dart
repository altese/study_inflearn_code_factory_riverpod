import 'package:flutter/material.dart';
import 'package:inflearn_code_factory_riverpod/layout/default_layout.dart';
import 'package:inflearn_code_factory_riverpod/screen/family_modifier_screen.dart';
import 'package:inflearn_code_factory_riverpod/screen/future_provider_screen.dart';
import 'package:inflearn_code_factory_riverpod/screen/state_notifier_provider_screen.dart';
import 'package:inflearn_code_factory_riverpod/screen/state_provider_screen.dart';
import 'package:inflearn_code_factory_riverpod/screen/stream_provider_screen.dart';

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
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const StateNotifierProviderScreen(),
                ),
              );
            },
            child: const Text('StateNotifierProvider'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const FutureProviderScreen(),
                ),
              );
            },
            child: const Text('FutureProvider'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const StreamProviderScreen(),
                ),
              );
            },
            child: const Text('StreamProvider'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const FamilyModifierScreen(),
                ),
              );
            },
            child: const Text('FamilyModifier'),
          ),
        ],
      ),
    );
  }
}
