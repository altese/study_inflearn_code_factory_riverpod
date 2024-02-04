import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inflearn_code_factory_riverpod/layout/default_layout.dart';
import 'package:inflearn_code_factory_riverpod/riverpod/listen_provider.dart';

class ListenScreen extends ConsumerStatefulWidget {
  const ListenScreen({super.key});

  @override
  ConsumerState<ListenScreen> createState() => _ListenScreenState();
}

class _ListenScreenState extends ConsumerState<ListenScreen>
    with TickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(
      length: 10,
      vsync: this,
      initialIndex: ref.read(listenProvider), // 디폴트 값: 0
    );
  }

  @override
  Widget build(BuildContext context) {
    // previous, next: 기존 state, 변경이 될 다음 state
    ref.listen<int>(listenProvider, (previous, next) {
      if (previous != next) {
        controller.animateTo(next);
      }
    });
    return DefaulLayout(
        title: 'ListenScreen',
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          children: List.generate(
            10,
            (index) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(index.toString()),
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(listenProvider.notifier)
                        .update((state) => state == 10 ? 10 : state + 1);
                  },
                  child: const Text('다음'),
                ),
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(listenProvider.notifier)
                        .update((state) => state == 0 ? 0 : state - 1);
                  },
                  child: const Text('이전'),
                ),
              ],
            ),
          ),
        ));
  }
}
