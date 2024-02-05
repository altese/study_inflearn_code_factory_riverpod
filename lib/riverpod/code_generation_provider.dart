import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'code_generation_provider.g.dart';

// code_generation을 사용하면
// 1. 어떤 프로바이더를 사용할지 고민할 필요 없다.
final _testProvider = Provider<String>((ref) => 'Hello');

@riverpod
String gState(GStateRef ref) {
  return 'Hello';
}

// futureProvider
@riverpod
Future<int> gStateFuture(GStateFutureRef ref) async {
  await Future.delayed(const Duration(seconds: 2));

  return 10;
}

// keepAlive
@Riverpod(keepAlive: true)
Future<int> gStateFuture2(GStateFuture2Ref ref) async {
  await Future.delayed(const Duration(seconds: 2));

  return 10;
}
