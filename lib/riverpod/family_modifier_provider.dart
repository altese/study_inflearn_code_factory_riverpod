import 'package:flutter_riverpod/flutter_riverpod.dart';

// family modifier는 어떤 프로바이더든 쓸 수 있다
final familyModifierProvider = FutureProvider.family<List<int>, int>(
  (ref, data) async {
    await Future.delayed(const Duration(seconds: 2));

    return List.generate(5, (index) => index * data);
  },
);
