import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_riverpod/screen/home_screen.dart';

void main() {
  runApp(ProviderScope(
      child: MaterialApp(
    home: HomeScreen(),
  )));
}
