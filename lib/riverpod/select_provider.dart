import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_riverpod/model/shopping_item_model.dart';

final selectProvider = StateNotifierProvider<SelectNotifier, ShoppingItemModel>((ref) => SelectNotifier());

class SelectNotifier extends StateNotifier<ShoppingItemModel> {
  SelectNotifier()
      : super(ShoppingItemModel(
      name: '김치', hasBought: true, isSpicy: false, quantity: 3));

  /// final로 등록된 함수를 반복적인 작업을 하지 않기위해 사용 => copyWith()와 같은 기능
  toggleHasBought() {
    state = state.copyWith(
      hasBought: !state.hasBought
    );
  }
  toggleIsSpicy(){
    state = state.copyWith(isSpicy: !state.isSpicy);
  }
}
