import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inflearn_code_factory_riverpod/layout/default_layout.dart';
import 'package:inflearn_code_factory_riverpod/riverpod/stream_provider.dart';

class StreamProviderScreen extends ConsumerWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<int>> state = ref.watch(multiplesStreamProvider);

    return DefaulLayout(
      title: 'StreamProviderScreen',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          state.when(
            data: (data) {
              return Text(data.toString(), textAlign: TextAlign.center);
            },
            error: (err, stack) => Text(err.toString()),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}
