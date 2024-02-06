import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inflearn_code_factory_riverpod/layout/default_layout.dart';
import 'package:inflearn_code_factory_riverpod/riverpod/code_generation_provider.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state1 = ref.watch(gStateProvider);
    final state2 = ref.watch(gStateFutureProvider);
    final state3 = ref.watch(gStateFuture2Provider);
    final state4 = ref.watch(gStateMultiplyProvider(number1: 2, number2: 4));

    return DefaulLayout(
      title: 'CodeGenerationScreen',
      body: Column(
        children: [
          Text('state1: $state1'),
          state2.when(
            data: (data) {
              return Text('state2: $data', textAlign: TextAlign.center);
            },
            error: (err, stack) => Text(err.toString()),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
          state3.when(
            data: (data) {
              return Text('state3: $data', textAlign: TextAlign.center);
            },
            error: (err, stack) => Text(err.toString()),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
          // const _StateFiveWidget(),
          // 상위 위젯까지 빌드되지 않기를 원할 때 Consumer 사용
          Consumer(
            builder: (context, ref, child) {
              final state5 = ref.watch(gStateNotifierProvider);

              // 새로 렌더링되어야 하는 위젯
              return Column(
                children: [
                  Text('state5: $state5'),
                  if (child != null) child,
                ],
              );
            },
            // 새로 렌더링되지 않기를 원하는 위젯
            child: const Text('hello'),
          ),
          Text('state4: $state4'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(gStateNotifierProvider.notifier).decrement();
                },
                child: const Text('-'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(gStateNotifierProvider.notifier).increment();
                },
                child: const Text('+'),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              // 초기화
              ref.invalidate(gStateNotifierProvider);
            },
            child: const Text('invalidate'),
          ),
        ],
      ),
    );
  }
}

class _StateFiveWidget extends ConsumerWidget {
  const _StateFiveWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state5 = ref.watch(gStateNotifierProvider);

    return Text('state5: $state5');
  }
}
