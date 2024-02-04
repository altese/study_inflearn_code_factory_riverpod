import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inflearn_code_factory_riverpod/layout/default_layout.dart';
import 'package:inflearn_code_factory_riverpod/riverpod/provider_in_provider.dart';
import 'package:inflearn_code_factory_riverpod/riverpod/state_notifier_provider.dart';

class ProviderInProviderScreen extends ConsumerWidget {
  const ProviderInProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(filteredShoppingListProvider);

    // ShoppintItemModel의 인스턴스가 출력됨
    // print(state);

    return DefaulLayout(
      title: 'ProviderInProviderScreen',
      actions: [
        PopupMenuButton<FilteredState>(
          elevation: 0.4,
          onSelected: (value) {
            ref.read(filterProvider.notifier).update((state) => value);
          },
          itemBuilder: (_) => FilteredState.values
              .map((e) => PopupMenuItem(
                    value: e,
                    child: Text(e.name),
                  ))
              .toList(),
        ),
      ],
      body: ListView(
        // shoppingListProvider의 상태를 바꾸고 있고
        // filteredShoppingListProvider를 watch하고 있는데
        // filteredShoppingListProvider 내부에서는 shoppingListProvider를 watch하고 있으므로
        // 빌드가 된다.
        children: state
            .map(
              (e) => CheckboxListTile(
                title: Text(e.name),
                value: e.hasBought,
                onChanged: (value) {
                  ref
                      .read(shoppingListProvider.notifier)
                      .toggleHasBought(name: e.name);
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
