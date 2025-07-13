// FlutterのUIコンポーネントをインポートします
import 'package:flutter/material.dart';
// Riverpodの状態管理機能を使用するためにインポートします
import 'package:flutter_riverpod/flutter_riverpod.dart';
// Riverpodのコード生成アノテーションを使用するためにインポートします
import 'package:riverpod_annotation/riverpod_annotation.dart';

// コード生成されたファイル（`class_counter.g.dart`）をインポートします。このファイルは`@riverpod`アノテーションに基づいて自動生成されます。
part 'class_counter.g.dart';

// CounterNotifierクラスをRiverpodのプロバイダとして定義することを示すアノテーションです。
@riverpod
// `CounterNotifier`は、コード生成によって`_`が接頭辞として付いた`_$CounterNotifier`を継承します。
// これにより、`StateNotifier`の機能が提供されます。
class CounterNotifier extends _$CounterNotifier {
  // プロバイダの初期状態を定義するメソッドです。
  // この場合、カウンターの初期値は0です。
  @override
  int build() {
    return 0;
  }

  // カウンターの値を1増やすメソッドです。
  // `state`は`StateNotifier`が保持する現在の状態（int型）を表します。
  void increment() {
    state = state + 1;
  }
}

// Riverpodのプロバイダを読み取るためのウィジェットを定義します。
// `ConsumerWidget`は、`WidgetRef`にアクセスし、プロバイダの状態変化に反応するために使用されます。
class GeneratorCounter extends ConsumerWidget {
  const GeneratorCounter({super.key});

  // ウィジェットのUIを構築するメソッドです。
  // `WidgetRef`を使用してプロバイダにアクセスします。
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // `counterNotifierProvider`を監視（watch）し、その現在の状態（int型のカウンター値）を取得します。
    // `watch`を使用することで、`counterNotifierProvider`の状態が変更されるたびにこのウィジェットが再構築されます。
    final counter = ref.watch(counterNotifierProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('（geneあり）クラス ：'),
        // `counterNotifierProvider`から取得した現在のカウンター値を表示するテキストウィジェットです。
        Text('$counter'),
        SizedBox(
          width: 16,
        ),
        ElevatedButton(
            onPressed: () {
              // `counterNotifierProvider`の`notifier`（`CounterNotifier`のインスタンス）を取得し、
              // その`increment`メソッドを呼び出してカウンターの値を増やします。
              // `read`は一度だけプロバイダのインスタンスを取得し、変更を監視しません。
              ref.read(counterNotifierProvider.notifier).increment();
            },
            child: Text('+'))
      ],
    );
  }
}