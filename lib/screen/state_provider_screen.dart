import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_riverpod/layout/default_layout.dart';
import 'package:test_riverpod/riverpod/state_provider_screen.dart';

//ConsumerWidget은 riverpod을 사용할 수 있다
class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(numberProvider);

    return DefaultLayout(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                provider.toString(),
              ),
              ElevatedButton(
                  onPressed: () {
                    ref.read(numberProvider.notifier).update((state) => state + 1);
                  },
                  child: Text('UP')),
              ElevatedButton(
                  onPressed: () {
                    ref.read(numberProvider.notifier).state = ref.read(numberProvider.notifier).state - 1;
                  },
                  child: Text('Down')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => _NextScreen()));
                  },
                  child: Text('_NextScreen'))
            ],
          ),
        ),
        title: 'StateProviderScreen');
  }
}

class _NextScreen extends ConsumerWidget {
  const _NextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(numberProvider);

    return DefaultLayout(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                provider.toString(),
              ),
              ElevatedButton(
                  onPressed: () {
                    ref.read(numberProvider.notifier).update((state) => state + 1);
                  },
                  child: Text('UP'))
            ],
          ),
        ),
        title: 'StateProviderScreen');
  }
}
