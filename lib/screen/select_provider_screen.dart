import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_riverpod/layout/default_layout.dart';

import '../riverpod/select_provider.dart';

class SelectProviderScreen extends ConsumerWidget {
  const SelectProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');

    /// 일반적인 방법
    // final state = ref.watch(selectProvider);
    ///특정한 값만 바굴경우
    final state = ref.watch(selectProvider.select((value) => value.isSpicy));

    /// isSpicy를 select로 보고 있기 때문에 내부적으로는 hasBought가 바뀌더라도 재빌드는 되지 않는다
    ref.listen(selectProvider.select((value) => value.hasBought),
        (previous, next) {
      print('next : $next');
    });

    return DefaultLayout(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ///특정 값만 바굴경우
              Text(state.toString()),

              /// 일반적인 방법
              // Text(state.name),
              // Text('${state.isSpicy}'),
              // Text('${state.hasBought}'),
              ElevatedButton(
                onPressed: () {
                  ref.read(selectProvider.notifier).toggleIsSpicy();
                },
                child: Text('Spicy Toggle'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(selectProvider.notifier).toggleHasBought();
                },
                child: Text('Spicy Toggle'),
              )
            ],
          ),
        ),
        title: 'SelectProviderScreen');
  }
}
