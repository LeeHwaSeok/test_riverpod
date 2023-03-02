import 'package:flutter/material.dart';
import 'package:test_riverpod/layout/default_layout.dart';
import 'package:test_riverpod/screen/family_modifier_screen.dart';
import 'package:test_riverpod/screen/listen_provider_screen.dart';
import 'package:test_riverpod/screen/select_provider_screen.dart';
import 'package:test_riverpod/screen/state_notifier_provider_screen.dart';
import 'package:test_riverpod/screen/state_provider_screen.dart';
import 'package:test_riverpod/screen/stream_provider_screen.dart';

import 'auto_dispose_modifier_screen.dart';
import 'future_provider_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'HomeScreen',
      body: ListView(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => StateProviderScreen()));
              },
              child: Text('StateProviderScreen')),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => StateNotifierProviderScreen()));
              },
              child: Text('StateNotifierProviderScreen')),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => FutureProviderScreen()));
              },
              child: Text('FutureProviderScreen')),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => StremProviderScreen()));
              },
              child: Text('StremProviderScreen')),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => FamilyModifierScreen()));
              },
              child: Text('FamilyModifierScreen')),

          /// autoDispose는 말 그대로 위젯 밖으로 떠나면 데이터를 삭제시켜줌
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => AutoDisposeModifierScreen()));
              },
              child: Text('AutoDisposeModifierScreen')),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => ListenProviderScreen()));
              },
              child: Text('ListenProviderScreen')),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => SelectProviderScreen()));
              },
              child: Text('SelectProviderScreen')),
        ],
      ),
    );
  }
}
