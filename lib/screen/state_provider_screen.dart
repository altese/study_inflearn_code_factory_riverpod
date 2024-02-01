import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inflearn_code_factory_riverpod/layout/default_layout.dart';
import 'package:inflearn_code_factory_riverpod/riverpod/state_provider.dart';

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int provider = ref.watch(numberProvider);

    return DefaulLayout(
      title: 'StateProviderScreen',
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(provider.toString()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(numberProvider.notifier)
                        .update((state) => state + 1);
                  },
                  child: const Text('up'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // 상태 값에 직접적으로 대입 가능
                    ref.read(numberProvider.notifier).state =
                        ref.read(numberProvider.notifier).state - 1;
                  },
                  child: const Text('down'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const _NextScreen()),
                );
              },
              child: const Text('다음 페이지로 가기'),
            ),
          ],
        ),
      ),
    );
  }
}

class _NextScreen extends ConsumerWidget {
  const _NextScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(numberProvider);

    return DefaulLayout(
      title: 'Next Page',
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(provider.toString()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(numberProvider.notifier)
                        .update((state) => state + 1);
                  },
                  child: const Text('up'),
                ),
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(numberProvider.notifier)
                        .update((state) => state - 1);
                  },
                  child: const Text('down'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
