import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_riverpod/model/shopping_item_model.dart';

final shoppingListProvider =
    StateNotifierProvider<ShoppingListNotifier, List<ShoppingItemModel>>((ref) => ShoppingListNotifier());

class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>> {
  // 상태 초기화
  ShoppingListNotifier()
      : super([
          ShoppingItemModel(name: '김치', hasBought: true, isSpicy: false, quantity: 3),
          ShoppingItemModel(name: '라면', hasBought: true, isSpicy: false, quantity: 3),
          ShoppingItemModel(name: '삼겹살', hasBought: false, isSpicy: true, quantity: 13),
          ShoppingItemModel(name: '카스테라', hasBought: true, isSpicy: true, quantity: 6),
          ShoppingItemModel(name: '수박', hasBought: false, isSpicy: false, quantity: 8)
        ]);

  void toggleHasBought({required String name}) {
    // statenotifier을 상속받으면 state가 생성됨
    state = state
        .map((e) => e.name == name
            ? ShoppingItemModel(name: e.name, hasBought: !e.hasBought, isSpicy: e.isSpicy, quantity: e.quantity)
            : e)
        .toList();
  }
}
