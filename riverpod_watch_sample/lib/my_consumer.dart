import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_watch/state/counter.dart';
import 'package:riverpod_watch/state/hello.dart';
import 'package:riverpod_watch/state/user.dart';

class MyConsumer extends ConsumerWidget {
  const MyConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 状態の読み取り
    final counter = ref.watch(counterProvider);
    final hello = ref.watch(helloProvider);
    // このように静的な値でもreadで読み取るのはアンチパターン
    // final hello = ref.read(helloProvider);

    // このようにbuildの直下でのreadはアンチパターン
    // final currentCount = ref.read(counterProvider);
    // final counter = ref.read(counterProvider.notifier);

    // Counterが更新されたら実行したい関数を登録
    ref.listen(counterProvider, (int? pre, int next) {
      print('$pre -> $next changed!');
    });

    // Userオブジェクトのnameだけを監視対象にする
    final userName = ref.watch(
      userNotifierProvider.select((user) => user.name),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$counter'),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                // 処理内での一次的な値の利用なので推奨される書き方
                final currentCount = ref.read(counterProvider);
                // 更新１：状態更新の呼び出しなので推奨される書き方
                final counter = ref.read(counterProvider.notifier);
                counter.increment();
                // 更新２：状態更新はメソッドチェーンの以下でもOK
                ref.read(counterProvider.notifier).increment();
              },
              child: Text('+'),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Userオブジェクトのnameを利用
            Text(userName),
            ElevatedButton(
              onPressed: () {
                // 状態の一部を更新する処理の呼び出し
                ref.read(userNotifierProvider.notifier).updateState(newName: '新しい名前');
              },
              child: Text('名前変更'),
            ),
          ],
        ),
        // 値の利用は通常の変数と同じ
        Text(hello),
      ],
    );
  }
}
