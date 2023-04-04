import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_riverpod/layout/default_layout.dart';
import 'package:test_riverpod/riverpod/provider.dart';

import '../riverpod/state_notifier_provider.dart';

class ProviderScreen extends ConsumerWidget {
  const ProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(filteredShoppingListProvider);

    print(state);
    return DefaultLayout(body:ListView(
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
    ), title: 'ProviderScreen',
    /// Popupmenubutton => 우측 옵션
    actions: [PopupMenuButton<FilterState>(itemBuilder: (_)=> FilterState.values.map((e) => PopupMenuItem(child: Text(e.name),value: e,)).toList(),
    onSelected: (value){ref.read(filterProvider.notifier).update((state) => value);},)],);
  }
}
