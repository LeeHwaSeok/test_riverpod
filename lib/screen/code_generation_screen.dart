import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_riverpod/layout/default_layout.dart';
import 'package:test_riverpod/riverpod/code_generation_provider.dart';

class CodeGenerationScreen extends ConsumerWidget{
  const CodeGenerationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state1 = ref.watch(gStateProvider);
    final state2 = ref.watch(gStateFutureProvider);
    final state3 = ref.watch(gStateFuture2Provider);
    final state4 = ref.watch(GStateMultiplyProvider(number1 : 3,number2: 2));

    return DefaultLayout(body: Column(
      children: [
        Text('State1 : $state1'),
        Text('State2 : $state2'),
        Text('State3 : $state3'),
        Text('State4 : $state4'),

      ],
    ), title: 'CodeGenerationScreen');
  }
}
