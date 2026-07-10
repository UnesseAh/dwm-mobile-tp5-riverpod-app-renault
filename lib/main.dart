import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app_renault/application/providers.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CounterPage());
  }
}

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterState = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Counter")),
      body: Center(child: Text("Counter value = $counterState")),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton.small(
            onPressed: () {
              ref.read(counterProvider.notifier).decrement();
            },
            child: Icon(Icons.remove),
          ),
          FloatingActionButton.small(
            onPressed: () {
              // ref.invalidate(counterProvider.notifier).increment();
              ref.refresh(counterProvider);
            },
            child: Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
