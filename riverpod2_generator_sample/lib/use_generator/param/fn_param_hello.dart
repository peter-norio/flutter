// FlutterのUIコンポーネントをインポートします
import 'package:flutter/material.dart';
// Riverpodの状態管理機能を使用するためにインポートします
import 'package:flutter_riverpod/flutter_riverpod.dart';
// Riverpodのコード生成アノテーションを使用するためにインポートします
import 'package:riverpod_annotation/riverpod_annotation.dart';

// コード生成されたファイル（`fn_param_hello.g.dart`）をインポートします。このファイルは`@riverpod`アノテーションに基づいて自動生成されます。
part 'fn_param_hello.g.dart';

// `helloParam`関数をRiverpodのプロバイダとして定義することを示すアノテーションです。
// このプロバイダは引数を受け取ります。
@riverpod
// `helloParam`という名前のプロバイダを定義します。
// このプロバイダは文字列と`user`という名前のString型引数を受け取ります。
String helloParam(Ref ref, String user) {
  // プロバイダが提供する値です。引数`user`を埋め込んだ文字列を返します。
  return 'Hello $user';
}

// Riverpodのプロバイダを読み取るためのウィジェットを定義します。
// `ConsumerWidget`は、`WidgetRef`にアクセスするために使用されます。
class ParamHello extends ConsumerWidget {
  const ParamHello({super.key});

  // 親クラスのメソッドをオーバーライドすることを示します。
  @override
  // ウィジェットのUIを構築するメソッドです。`WidgetRef`を使用してプロバイダにアクセスします。
  Widget build(BuildContext context, WidgetRef ref) {
    // `helloParamProvider`を監視（watch）し、`'John'`を引数として渡してその値を取得します。
    // `helloParamProvider`は、`@riverpod`アノテーションによって自動生成された`family`プロバイダです。
    // `watch`は、プロバイダの値が変更されるとウィジェットを再構築します。
    final helloUser = ref.watch(helloParamProvider('John'));

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('（geneあり）関数 引数：'),
        // `helloParamProvider`から取得した文字列を表示するテキストウィジェットです。
        Text(helloUser),
      ],
    );
  }
}