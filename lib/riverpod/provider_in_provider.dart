import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inflearn_code_factory_riverpod/model/shopping_item_model.dart';
import 'package:inflearn_code_factory_riverpod/riverpod/state_notifier_provider.dart';

final filteredShoppingListProvider = Provider<List<ShoppingItemModel>>(
  // 프로바이더 안에서 프로바이더를 부를 때는 꼭 watch를 쓴다.
  // shoppingListProvider가 변경되면 filteredShoppingList도 변경되어야하기 때문
  (ref) {
    final filterState = ref.watch(filterProvider);
    final shoppingListState = ref.watch(shoppingListProvider);

    if (filterState == FilteredState.all) {
      return shoppingListState;
    }

    return shoppingListState
        .where((element) => filterState == FilteredState.spicy
            ? element.isSpicy
            : !element.isSpicy)
        .toList();
  },
);

enum FilteredState { notSpicy, spicy, all }

final filterProvider = StateProvider<FilteredState>((ref) => FilteredState.all);
