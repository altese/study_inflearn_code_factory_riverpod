import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inflearn_code_factory_riverpod/model/shopping_item_model.dart';

// 제네릭에는 StateNotifier를 상속받은 클래스와 해당 클래스의 상태의 타입을 넣어준다.
final shoppingListProvider =
    StateNotifierProvider<ShoppingListNotifier, List<ShoppingItemModel>>(
  // 관리할 클래스를 인스턴스로 만듦
  (ref) => ShoppingListNotifier(),
);

// StateNotifier를 상속한다.
class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>> {
  // 초기값: 생성자에 만들어 준다.
  ShoppingListNotifier()
      : super([
          ShoppingItemModel(
            name: '김치찜',
            quantity: 3,
            hasBought: false,
            isSpicy: true,
          ),
          ShoppingItemModel(
            name: '라면',
            quantity: 10,
            hasBought: false,
            isSpicy: true,
          ),
          ShoppingItemModel(
            name: '수박',
            quantity: 2,
            hasBought: false,
            isSpicy: false,
          ),
          ShoppingItemModel(
            name: '카스테라',
            quantity: 5,
            hasBought: false,
            isSpicy: false,
          ),
        ]);

  // 물건 구입 여부를 토글하는 메소드: map은 완전히 새로운 리스트를 반환
  void toggleHasBought({required String name}) {
    // 이름이 같으면 토글
    state = state
        .map((ShoppingItemModel e) => e.name == name
            ? ShoppingItemModel(
                name: e.name,
                quantity: e.quantity,
                hasBought: !e.hasBought, // hasBout만 토글
                isSpicy: e.isSpicy,
              )
            : e)
        .toList();
  }
}
