// FlutterのUIコンポーネントをインポートします
import 'package:flutter/material.dart';
// Riverpodの状態管理機能を使用するためにインポートします
import 'package:flutter_riverpod/flutter_riverpod.dart';
// Riverpodのコード生成アノテーションを使用するためにインポートします
import 'package:riverpod_annotation/riverpod_annotation.dart';

// コード生成されたファイル（`fn_future_hello.g.dart`）をインポートします。このファイルは`@riverpod`アノテーションに基づいて自動生成されます。
part 'fn_future_hello.g.dart';

// `futureHello`関数をRiverpodのプロバイダとして定義することを示すアノテーションです。
// このプロバイダは非同期的に文字列を返します。
@riverpod
// `futureHello`という名前のプロバイダを定義します。
// このプロバイダは`Future<String>`を返し、非同期処理を伴います。
Future<String> futureHello(Ref ref) async {
  // 3秒間の遅延をシミュレートします。これは非同期処理（例: ネットワーク通信）を模倣しています。
  await Future.delayed(Duration(seconds: 3));
  // 非同期処理が成功した場合に返す文字列です。
  return 'Hello Future';
}

// Riverpodのプロバイダを読み取るためのウィジェットを定義します。
// `ConsumerWidget`は、`WidgetRef`にアクセスし、プロバイダの状態変化に反応するために使用されます。
class FutureHello extends ConsumerWidget {
  const FutureHello({super.key});

  @override
  // ウィジェットのUIを構築するメソッドです。`WidgetRef`を使用してプロバイダにアクセスします。
  Widget build(BuildContext context, WidgetRef ref) {
    // `futureHelloProvider`を監視（watch）し、その値を`AsyncValue<String>`型で取得します。
    // `watch`は、プロバイダの値が変更されるとこのウィジェットを再構築します。
    final AsyncValue<String> hello = ref.watch(futureHelloProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('（geneあり）関数 Future：'),
        // `AsyncValue`の`when`メソッドを使って、非同期処理の現在の状態に応じて異なるUIを表示します。
        hello.when(
            // 非同期処理が「ロード中」の状態の場合に表示されるウィジェットです。
            loading: () => Text('ロード中'),
            // 非同期処理が成功し「データ」が取得できた状態の場合に表示されるウィジェットです。
            data: (hello) => Text(hello),
            // 非同期処理中に「エラー」が発生した場合に表示されるウィジェットです。
            error: (e, st) => Text(e.toString())),
      ],
    );
  }
}