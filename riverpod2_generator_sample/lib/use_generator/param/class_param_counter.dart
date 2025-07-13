// FlutterのUIコンポーネントをインポートします
import 'package:flutter/material.dart';
// Riverpodの状態管理機能を使用するためにインポートします
import 'package:flutter_riverpod/flutter_riverpod.dart';
// Riverpodのコード生成アノテーションを使用するためにインポートします
import 'package:riverpod_annotation/riverpod_annotation.dart';

// コード生成されたファイル（`class_param_counter.g.dart`）をインポートします。このファイルは`@riverpod`アノテーションに基づいて自動生成されます。
part 'class_param_counter.g.dart';

// `CounterParamNotifier`クラスをRiverpodのプロバイダとして定義することを示すアノテーションです。
// このクラスプロバイダは引数を受け取ります。
@riverpod
// `CounterParamNotifier`は、コード生成によって`_`が接頭辞として付いた`_$CounterParamNotifier`を継承します。
// これにより、`StateNotifier`の機能が提供されます。
class CounterParamNotifier extends _$CounterParamNotifier {
  // プロバイダの初期状態を定義するメソッドです。
  // このメソッドは`count`というint型引数を受け取り、それを初期値として返します。
  @override
  int build(int count) {
    return count;
  }

  // カウンターの値を1増やすメソッドです。
  // `state`は`StateNotifier`が保持する現在の状態（int型）を表します。
  void increment() {
    state = state + 1;
  }
}

// Riverpodのプロバイダを読み取るためのウィジェットを定義します。
// `ConsumerWidget`は、`WidgetRef`にアクセスし、プロバイダの状態変化に反応するために使用されます。
class ParamCounter extends ConsumerWidget {
  const ParamCounter({super.key});

  @override
  // ウィジェットのUIを構築するメソッドです。`WidgetRef`を使用してプロバイダにアクセスします。
  Widget build(BuildContext context, WidgetRef ref) {
    // `counterParamNotifierProvider`のインスタンスを生成します。
    // 引数として`10`を渡すことで、カウンターの初期値が10に設定されたプロバイダが取得されます。
    // この`counterNotifier`はプロバイダの参照であり、まだ実際の値ではありません。
    final counterNotifier = counterParamNotifierProvider(10);
    // `counterNotifier`プロバイダの状態を監視（watch）し、その現在の値（int型のカウンター値）を取得します。
    // `watch`を使用することで、プロバイダの状態が変更されるたびにこのウィジェットが再構築されます。
    final counter = ref.watch(counterNotifier);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('（geneあり）クラス 引数：'),
        // `counterNotifier`プロバイダから取得した現在のカウンター値を表示するテキストウィジェットです。
        Text('$counter'),
        // 子ウィジェット間の水平方向のスペースを追加します。
        SizedBox(
          width: 16,
        ),
        // ボタンウィジェットを定義します。
        ElevatedButton(
            onPressed: () {
              // `counterNotifier`プロバイダの`notifier`（`CounterParamNotifier`のインスタンス）を取得し、
              // その`increment`メソッドを呼び出してカウンターの値を増やします。
              // `read`は一度だけプロバイダのインスタンスを取得し、変更を監視しません。
              ref.read(counterNotifier.notifier).increment();
            },
            child: Text('+'))
      ],
    );
  }
}