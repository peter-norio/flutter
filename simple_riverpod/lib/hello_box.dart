// 手順3（赤波線の上で cmd + . で補完可能）
// Materialをインポート：Flutterの基本ウィジェットなのでRiverpodとは直接関係しない
import 'package:flutter/material.dart';
// Riverpodをインポート：ConsumerWidgetのコンパイルエラーを解消
import 'package:flutter_riverpod/flutter_riverpod.dart';
// 手順４-2（手順４のref.watchの引数を記述する際に補完で自動的に入力される）
// 自動生成されたプロバイダーをインポート：手順４のref.watchの引数で利用
import 'package:simple_riverpod/hello_provider.dart';

// 手順１：hello_box.dartファイルを作成
// 手順２：「stlessConsumer」と入力し補完でConsumerWidgetを生成
//    →今回はHelloBoxクラスという名前にする
class HelloBox extends ConsumerWidget {
  const HelloBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 手順４-1：helloプロバイダーの値を参照
    //  →引数の「helloProvider」はコード生成で作られたもの
    final hello = ref.watch(helloProvider);

    // 手順５：プロバイダーの値を利用したウィジェットを作成
    return Scaffold(
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          color: Colors.red,
          // Textの引数にプロバイダーの値を利用している
          child: Center(child: Text(hello)),
        ),
      ),
    );
  }
}
