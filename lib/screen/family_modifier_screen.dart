import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inflearn_code_factory_riverpod/layout/default_layout.dart';
import 'package:inflearn_code_factory_riverpod/riverpod/family_modifier_provider.dart';

class FamilyModifierScreen extends ConsumerWidget {
  const FamilyModifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(familyModifierProvider(5));

    return DefaulLayout(
      title: 'FamilyModifierScreen',
      body: Center(
        child: state.when(
          data: (data) => Text(data.toString()),
          error: (err, stack) => Text(err.toString()),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
