import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_riverpod/model/shopping_item_model.dart';

//상속한 클래스를 Provider로 상태관리시켜주는거임
final shoppingListProvider =
    //제너릭은 < 타겟 class , 타겟 type > => 타겟class 형식입니다
    StateNotifierProvider<ShoppingListNotifier, List<ShoppingItemModel>>((ref) => ShoppingListNotifier());

// StateNotifier를 상속해줘야함 type도 선정해줘야합니다.
class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>> {

  //ShoppingListNotifier를 불러서 this : this 같은느낌인거같은데 최초 초기화를 진행해야합니다.
  ShoppingListNotifier()
      : super([
        //Item형식에 맞춰서 ShoppingList...의 초기값을 생성해주는겁니다 init효과
        // 강사 : StateNotifier에서는 super이하에 타겟 type과 동일한 형태의 데이터의 state를 정의해줘야합니다
          ShoppingItemModel(name: '김치', hasBought: true, isSpicy: true, quantity: 3),
          ShoppingItemModel(name: '라면', hasBought: true, isSpicy: true, quantity: 3),
          ShoppingItemModel(name: '삼겹살', hasBought: false, isSpicy: false, quantity: 13),
          ShoppingItemModel(name: '카스테라', hasBought: true, isSpicy: false, quantity: 6),
          ShoppingItemModel(name: '수박', hasBought: false, isSpicy: false, quantity: 8),
          ShoppingItemModel(name: '수작', hasBought: false, isSpicy: false, quantity:2 ),
        ]);

  //toggleHasBought는 name값을 받아와서 해당값만 상태를 변경시킵니다.
  void toggleHasBought({required String name}) {
    // StateNotifier를 상속받으면 state가 생성됩니다. 생성된 state에는 super이하로 생성된 ShoppingItemModel의 데이터들이 존재합니다.
    // 강사 : state는 super 이하로 생성한 첫번째 파라미터로 초기화가 됩니다.
    state = state
        .map((e) => e.name == name
            ? ShoppingItemModel(name: e.name, hasBought: !e.hasBought, isSpicy: e.isSpicy, quantity: e.quantity)
            : e)
    //.toList를 사용하는 것은 바뀐 데이터로 새로운 리스트를 반환하기 위해서 사용합니다.
        .toList();
  }
}
