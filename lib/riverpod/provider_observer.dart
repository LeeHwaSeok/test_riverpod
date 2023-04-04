import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 프로바이더 옵저버 - 3가지
class Logger extends ProviderObserver{
  @override
  /// provider = type, previousvalue = 현재 값, new... = 다음 / container = flutter에서는 상관없음
  /// provider 업데이트 될때마다 값을 확인할 수 있음
  void didUpdateProvider(ProviderBase provider, Object? previousValue, Object? newValue,
      ProviderContainer container) {
    print('[Provider Update] \nprovider : $provider \npv: $previousValue \nnv: $newValue');
  }
  @override
  void didAddProvider(ProviderBase provider, Object? value, ProviderContainer container) {
    print('[Provider Added] \nprovider : $provider \nvalue : $value');
  }

  /// 프로바이드가 삭제되었을 때
  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer container) {
    print('[Provider didDispose] \nprovider : $provider');
  }

}