import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver {
  // 프로바이더들이 업데이트되었을 때 무조건 이 코드가 실행됨
  @override
  void didUpdateProvider(
    // 프로바이더
    ProviderBase<Object?> provider,
    // 기존 값
    Object? previousValue,
    // 다음 값
    Object? newValue,
    // 프로바이더를 담고 있는 컨테이너: 신경 안 써도 됨
    ProviderContainer container,
  ) {
    print(
        '[Provider Updated] provider: $provider / pv: $previousValue / nv: $newValue');
    super.didUpdateProvider(provider, previousValue, newValue, container);
  }

  // 프로바이더가 추가되었을 떄 호출
  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    print('[Provider Added] provider: $provider / v: $value');
    super.didAddProvider(provider, value, container);
  }

  // 프로바이더가 삭제되었을 때 호출
  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    print('[Provider Disposed] provider: $provider');
    super.didDisposeProvider(provider, container);
  }
}
