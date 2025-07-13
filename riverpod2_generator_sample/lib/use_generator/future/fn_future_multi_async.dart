// FlutterのUIコンポーネントをインポートします
import 'package:flutter/material.dart';
// Riverpodの状態管理機能を使用するためにインポートします
import 'package:flutter_riverpod/flutter_riverpod.dart';
// Riverpodのコード生成アノテーションを使用するためにインポートします
import 'package:riverpod_annotation/riverpod_annotation.dart';

// コード生成されたファイル（`fn_future_multi_async.g.dart`）をインポートします。このファイルは`@riverpod`アノテーションに基づいて自動生成されます。
part 'fn_future_multi_async.g.dart';

// `async1`関数をRiverpodのプロバイダとして定義することを示すアノテーションです。
// このプロバイダは非同期的に整数値を返します。
@riverpod
// `async1`という名前のプロバイダを定義します。
// このプロバイダは`Future<int>`を返し、非同期処理を伴います。
Future<int> async1(Ref ref) async {
  // 3秒間の遅延をシミュレートします。これは非同期処理（例: ネットワーク通信）を模倣しています。
  await Future.delayed(Duration(seconds: 3));
  // 非同期処理が成功した場合に返す整数値です。
  return 1;
}

// `async2`関数をRiverpodのプロバイダとして定義することを示すアノテーションです。
// このプロバイダは非同期的に整数値を返します。
@riverpod
// `async2`という名前のプロバイダを定義します。
// このプロバイダは`Future<int>`を返し、非同期処理を伴います。
Future<int> async2(Ref ref) async {
  // 3秒間の遅延をシミュレートします。これは非同期処理（例: ネットワーク通信）を模倣しています。
  await Future.delayed(Duration(seconds: 3));
  // 非同期処理が成功した場合に返す整数値です。
  return 1;
}

// `multiAsync`関数をRiverpodのプロバイダとして定義することを示すアノテーションです。
// このプロバイダは複数の非同期プロバイダの結果を結合します。
@riverpod
// `multiAsync`という名前のプロバイダを定義します。
// このプロバイダは`Future<int>`を返し、非同期処理を伴います。
Future<int> multiAsync(Ref ref) async {
  // `async1Provider`のFutureを監視し、その解決を待ちます。
  // `await`により、`async1Provider`がローディング中またはエラーの場合、`multiAsync`プロバイダもその状態に自動的に遷移します。
  final int data1 = await ref.watch(async1Provider.future);
  // `async2Provider`のFutureを監視し、その解決を待ちます。
  // `await`により、`async2Provider`がローディング中またはエラーの場合、`multiAsync`プロバイダもその状態に自動的に遷移します。
  final int data2 = await ref.watch(async2Provider.future);
  
  // 2つの非同期処理の結果を合計して返します。
  return data1 + data2;
}

// Riverpodの非同期プロバイダを読み取るためのウィジェットを定義します。
// `ConsumerWidget`は、`WidgetRef`にアクセスし、プロバイダの状態変化に反応するために使用されます。
class FutureMutltiAsync extends ConsumerWidget {
  const FutureMutltiAsync({super.key});

  @override
  // ウィジェットのUIを構築するメソッドです。`WidgetRef`を使用してプロバイダにアクセスします。
  Widget build(BuildContext context, WidgetRef ref) {
    // `multiAsyncProvider`を監視（watch）し、その値を`AsyncValue<int>`型で取得します。
    // `watch`は、プロバイダの値（ローディング、データ、エラー）が変更されるたびにこのウィジェットを再構築します。
    final AsyncValue<int> multiAsync = ref.watch(multiAsyncProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('（geneあり）関数 Future 複数：'),
        // `AsyncValue`の`when`メソッドを使って、非同期処理の現在の状態に応じて異なるUIを表示します。
        multiAsync.when(
            // 非同期処理が「ロード中」の状態の場合に表示されるウィジェットです。
            loading: () => Text('ロード中'),
            // 非同期処理が成功し「データ」が取得できた状態の場合に表示されるウィジェットです。
            // 取得した合計値を文字列に変換して表示します。
            data: (sum) => Text('$sum'),
            // 非同期処理中に「エラー」が発生した場合に表示されるウィジェットです。
            // エラーオブジェクトを文字列に変換して表示します。
            error: (e, st) => Text(e.toString())),
      ],
    );
  }
}