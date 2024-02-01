import 'package:flutter_riverpod/flutter_riverpod.dart';

// 매번 새로 상태 값이 생성됨: 캐시를 자동으로 삭제함
final autoDisposeModifierProvider = FutureProvider.autoDispose<List<int>>(
  (ref) async {
    await Future.delayed(const Duration(seconds: 2));

    return [1, 2, 3, 4, 5];
  },
);
