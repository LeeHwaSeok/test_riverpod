import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'code_generation_provider.g.dart';

/// 1) 어떤 Provider를 사용할지 고민할 필요 없도록
/// Provider, FutureProvider, StreamProvider(22.12 x) etc...
/// StateNotifierProvider는 명시적으로 지정해야함

final _testProvider = Provider<String>((ref) =>'Hello code Generation');

@riverpod
String gState(GStateRef ref){
  return 'Hello code Generation';
}

@riverpod
Future<int> gStateFuture(GStateFutureRef ref) async{
  await Future.delayed(Duration(seconds: 3));
  return 10;
}

@Riverpod(
  /// 값을 보관함 => autoDispose를 실행하지 않음
  keepAlive: true,
)
Future<int> gStateFuture2(GStateFuture2Ref ref) async{
  await Future.delayed(Duration(seconds: 3));
  return 10;
}

/// 2) Parameter => family [이전에는 generic으로 만들어줘야함]
/// 파라미터를 일반 함수처럼 사용할 수 있또록 지원

class Parameter{
  final int number1;
  final int number2;

  Parameter({
    required this.number1, required this.number2
});
}
final _testFamilyProvider = Provider.family<int, Parameter>((ref, Parameter) => Parameter.number1 * Parameter.number2,);

@riverpod
int gStateMultiply(GStateMultiplyRef ref,{required int number1, required int number2}){
  int result = number1;
  for(int i = 0; number2 > i; i++){
    result *= number2;
  }
  return result;

}