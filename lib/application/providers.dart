import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterNotifier extends Notifier<int> {
  @override
  int build() {
    return 10;
  }

  void increment() {
    int step = ref.read(stepProvider);
    state = state + step;
  }

  void decrement() {
    int step = ref.read(stepProvider);
    state = state - step;
  }
}

final counterProvider = NotifierProvider<CounterNotifier, int>(
  () => CounterNotifier(),
);

final stepProvider = Provider<int>((ref) {
  return 2;
});
