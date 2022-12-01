import 'dart:async';

extension AsyncMap<K, V> on Map<K, V> {
  Future<void> forEachAsync(FutureOr<void> Function(K, V) func) async {
    for (var value in entries) {
      final k = value.key;
      final v = value.value;
      await func(k, v);
    }
  }
}
