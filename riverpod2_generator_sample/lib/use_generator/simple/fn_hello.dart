// FlutterのUIコンポーネントをインポートします
import 'package:flutter/material.dart';
// Riverpodの状態管理機能を使用するためにインポートします
import 'package:flutter_riverpod/flutter_riverpod.dart';
// Riverpodのコード生成アノテーションを使用するためにインポートします
import 'package:riverpod_annotation/riverpod_annotation.dart';

// コード生成されたファイル（`fn_hello.g.dart`）をインポートします。このファイルは`@riverpod`アノテーションに基づいて自動生成されます。
part 'fn_hello.g.dart';

// hello関数をRiverpodのプロバイダとして定義することを示すアノテーションです。
@riverpod
// `hello`という名前のプロバイダを定義します。このプロバイダは文字列を返します。
String hello(Ref ref) {
  // `Ref`オブジェクトは、他のプロバイダにアクセスしたり、プロバイダのライフサイクルを管理したりするために使用されますが、この例では直接使用していません。
  // プロバイダが提供する値です。
  return 'Hello Riverpod';
}

// Riverpodのプロバイダを読み取るためのウィジェットを定義します。`ConsumerWidget`は、`WidgetRef`にアクセスするために使用されます。
class GeneratorHello extends ConsumerWidget {
  const GeneratorHello({super.key});

  @override
  // ウィジェットのUIを構築するメソッドです。`WidgetRef`を使用してプロバイダにアクセスします。
  Widget build(BuildContext context, WidgetRef ref) {
    // `helloProvider`を監視（watch）し、その値を取得します。`helloProvider`は、`@riverpod`アノテーションによって自動生成されたプロバイダです。
    // `watch`は、プロバイダの値が変更されるとウィジェットを再構築します。
    final hello = ref.watch(helloProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('（geneあり）関数：'),
        // `helloProvider`から取得した文字列を表示するテキストウィジェットです。
        Text(hello),
      ],
    );
  }
}