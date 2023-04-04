import 'package:riverpod/riverpod.dart';
import 'package:test_riverpod/model/shopping_item_model.dart';
import 'package:test_riverpod/riverpod/state_notifier_provider.dart';

final filteredShoppingListProvider = Provider<List<ShoppingItemModel>>(
    (ref) {
      final filterState = ref.watch(filterProvider);
      final shoppingListState = ref.watch(shoppingListProvider);

      if(filterState ==FilterState.all){
        return shoppingListState;
      }

      return shoppingListState.where((element) =>
      filterState == FilterState.spicy ? element.isSpicy : !element.isSpicy).toList();
    },
);

/// 필터링 진행 중
enum FilterState{
  notSpicy,
  spicy,
  all,
}

final filterProvider = StateProvider<FilterState>((ref) => FilterState.all);