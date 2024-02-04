import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inflearn_code_factory_riverpod/model/shopping_item_model.dart';

final selectProvider = StateNotifierProvider<SelectNotifier, ShoppingItemModel>(
  (ref) => SelectNotifier(),
);

class SelectNotifier extends StateNotifier<ShoppingItemModel> {
  SelectNotifier()
      : super(
          ShoppingItemModel(
            name: '김치찜',
            quantity: 3,
            hasBought: false,
            isSpicy: true,
          ),
        );

  // 바꾸고 싶은 값은 하나뿐인데 반복적으로 코드를 작성하는 게 비효율적 -> copyWith
  toggleHasBought() {
    // state = ShoppingItemModel(
    //   name: state.name,
    //   quantity: state.quantity,
    //   hasBought: !state.hasBought,
    //   isSpicy: state.isSpicy,
    // );
    state = state.copyWith(hasBought: !state.hasBought);
  }

  toggleIsSpicy() {
    // state = ShoppingItemModel(
    //   name: state.name,
    //   quantity: state.quantity,
    //   hasBought: state.hasBought,
    //   isSpicy: !state.isSpicy,
    // );
    state = state.copyWith(isSpicy: !state.isSpicy);
  }
}
