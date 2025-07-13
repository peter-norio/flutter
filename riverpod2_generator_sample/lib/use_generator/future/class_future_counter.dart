// FlutterのUIコンポーネントをインポートします
import 'package:flutter/material.dart';
// Riverpodの状態管理機能を使用するためにインポートします
import 'package:flutter_riverpod/flutter_riverpod.dart';
// Riverpodのコード生成アノテーションを使用するためにインポートします
import 'package:riverpod_annotation/riverpod_annotation.dart';

// コード生成されたファイル（`class_future_counter.g.dart`）をインポートします。このファイルは`@riverpod`アノテーションに基づいて自動生成されます。
part 'class_future_counter.g.dart';

// `FutureCounterNotifier`クラスをRiverpodのプロバイダとして定義することを示すアノテーションです。
// このクラスプロバイダは非同期的に値を管理します。
@riverpod
// `FutureCounterNotifier`は、コード生成によって`_`が接頭辞として付いた`_$FutureCounterNotifier`を継承します。
// これにより、`AsyncNotifier`の機能が提供されます。
class FutureCounterNotifier extends _$FutureCounterNotifier {
  // プロバイダの初期状態を非同期的に定義するメソッドです。
  // この場合、初期値を取得するまでに3秒かかります。
  @override
  Future<int> build() async {
    // 3秒間の遅延をシミュレートします。これは非同期処理（例: ネットワーク通信）を模倣しています。
    await Future.delayed(Duration(seconds: 3));
    // 非同期処理が成功した場合に返す初期値です。
    return 0;
  }

  // カウンターの値を1増やすメソッドです。この処理も非同期的に行われます。
  void increment() async {
    // 現在のプロバイダの状態から値（int型）を安全に取得します。
    // もし現在の状態がデータを持たない（ローディング中やエラー）場合は`null`を返します。
    final currentValue = state.valueOrNull;
    // `currentValue`が`null`の場合（例：まだ初期ロードが完了していない、またはエラー状態）は、処理を中断します。
    if (currentValue == null) {
      return;
    }
    // カウントアップ処理が始まったことを示すため、プロバイダの状態を「ロード中」に設定します。
    // これにより、`watch`しているウィジェット側がロード中UIに切り替わります。
    state = AsyncValue.loading();
    // カウントアップ処理にかかる時間をシミュレートするために1秒間遅延します。
    await Future.delayed(Duration(seconds: 1));
    // 新しいカウント値（現在の値に1を加えたもの）でプロバイダの状態を更新します。
    // `AsyncValue.data()`を使って、データが利用可能になったことを示します。
    state = AsyncValue.data(currentValue + 1);
  }
}

// Riverpodの非同期プロバイダを読み取るためのウィジェットを定義します。
// `ConsumerWidget`は、`WidgetRef`にアクセスし、プロバイダの状態変化に反応するために使用されます。
class FutureCounter extends ConsumerWidget {
  const FutureCounter({super.key});

  @override
  // ウィジェットのUIを構築するメソッドです。`WidgetRef`を使用してプロバイダにアクセスします。
  Widget build(BuildContext context, WidgetRef ref) {
    // `futureCounterNotifierProvider`を監視（watch）し、その値を`AsyncValue<int>`型で取得します。
    // `watch`は、プロバイダの値（ローディング、データ、エラー）が変更されるたびにこのウィジェットを再構築します。
    final AsyncValue<int> counter = ref.watch(futureCounterNotifierProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('（geneあり）クラス Future：'),
        // `AsyncValue`の`when`メソッドを使って、非同期処理の現在の状態に応じて異なるUIを表示します。
        counter.when(
            // 非同期処理が「ロード中」の状態の場合に表示されるウィジェットです。
            loading: () => Text('ロード中'),
            // 非同期処理が成功し「データ」が取得できた状態の場合に表示されるウィジェットです。
            // 取得したカウンター値を文字列に変換して表示します。
            data: (counter) => Text('$counter'),
            // 非同期処理中に「エラー」が発生した場合に表示されるウィジェットです。
            // エラーオブジェクトを文字列に変換して表示します。
            error: (e, st) => Text(e.toString())),
        SizedBox(
          width: 16,
        ),
        ElevatedButton(
            onPressed: () {
              // `futureCounterNotifierProvider`の`notifier`（`FutureCounterNotifier`のインスタンス）を取得し、
              // その`increment`メソッドを呼び出してカウンターの値を増やします。
              // `read`は一度だけプロバイダのインスタンスを取得し、変更を監視しません。
              ref.read(futureCounterNotifierProvider.notifier).increment();
            },
            child: Text('+'))
      ],
    );
  }
}