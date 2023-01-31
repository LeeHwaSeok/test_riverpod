import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_riverpod/layout/default_layout.dart';
import 'package:test_riverpod/riverpod/future_provider.dart';

/// 이름에서 알수있 듯 비동기식 데이터 처리를 진행하기 위한 예제
class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue state = ref.watch(multiplesFutureProvider);

    return DefaultLayout(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /** .when 함수
         * data => 실제 데이터
         * error => 에러시 발생하는 데이터
         * loading => 로딩중 표출할 데이터
             * 데이터가 캐싱이되어 해당 위젯에 재 접근했을 때, 리랜더 되지 않음*/
            state.when(
                data: (data) {
                  return Text(
                    data.toString(),
                    textAlign: TextAlign.center,
                  );
                },
                error: (err, stack) => Text(
                      err.toString(),
                    ),
                loading: () => Center(child: CircularProgressIndicator()))
          ],
        ),
        title: 'FutureProviderScreen');
  }
}
