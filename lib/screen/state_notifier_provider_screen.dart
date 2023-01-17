import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_riverpod/layout/default_layout.dart';
import 'package:test_riverpod/model/shopping_item_model.dart';
import 'package:test_riverpod/riverpod/state_notifier_provider.dart';

//ConsumerWidget : state provider를 사용하려면 필요한 클래스
class StateNotifierProviderScreen extends ConsumerWidget {
  const StateNotifierProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //변경된 값을 가져올때 List<타겟 타입> state= ref.watch(상태관리 변수)
    final List<ShoppingItemModel> state = ref.watch(shoppingListProvider)
    //각각의 state별로 포문돌려서 값 출력
    // state.forEach((instance) => print(instance.name));

    return DefaultLayout(
        body: ListView(
          children: state
              .map((e) => CheckboxListTile(
                    value: e.hasBought,
                    onChanged: (value) {
                      //함수에서 provider를 사용하려면 ref.read를 사용합니다.
                      // .nofitier를 사용하면 class의 메소드를 사용가능
                      ref.read(shoppingListProvider.notifier).toggleHasBought(name: e.name);
                    },
                    title: Text(e.name),
                  ))
              .toList(),
        ),
        title: 'StateNotifierProvider');
  }
}
