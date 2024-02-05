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

// family modifier ---
// 기존 사용법: 값을 여러 개 파라미터로 보내려면 모델을 만들어야 했다.
class Parameter {
  final int number1;
  final int number2;

  Parameter({required this.number1, required this.number2});
}

final _testFamilyProvider = Provider.family<int, Parameter>(
  (ref, parameter) => parameter.number1 * parameter.number2,
);

// 제네레이터
@riverpod
int gStateMultiply(
  GStateMultiplyRef ref, {
  required int number1,
  required int number2,
}) {
  return number1 * number2;
}
