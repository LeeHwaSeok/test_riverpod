import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_riverpod/layout/default_layout.dart';

import '../riverpod/stream_provider.dart';

class StremProviderScreen extends ConsumerWidget {
  const StremProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(multipleStreamProvider);

    return DefaultLayout(
        body: Center(
          child: state.when(
              data: (data) => Text(data.toString()),
              error: (error, stack) => Text(error.toString()),
              loading: () => CircularProgressIndicator()),
        ),
        title: 'StreamProviderScreen');
  }
}
