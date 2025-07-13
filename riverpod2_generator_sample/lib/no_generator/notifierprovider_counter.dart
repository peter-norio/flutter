// FlutterのUIウィジェット（この場合はMaterial Design）をインポートします
import 'package:flutter/material.dart';
// Riverpodの状態管理機能を利用するためにインポートします
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 状態（この場合はint型）とその変更ロジックを管理するNotifierクラスを定義します
class CounterNotifier extends Notifier<int> {
  @override
  // このNotifierが初めて読み込まれたときに状態を初期化するメソッドです
  build() {
    // カウンターの初期値を0に設定します
    return 0;
  }

  // 状態を更新するためのメソッドを定義します
  void increment() {
    // 現在の状態（state）に1を足して、新しい状態として更新します
    state = state + 1;
  }
}

// 上で定義したCounterNotifierのインスタンスを提供するNotifierProviderを定義します
final counterNotifierProvider = NotifierProvider<CounterNotifier, int>(() {
  // このプロバイダが要求されたときに、CounterNotifierの新しいインスタンスを返します
  return CounterNotifier();
});

// Providerの値を読み取り、UIを構築するウィジェットを定義します
class Counter extends ConsumerWidget {
  // このウィジェットのコンストラクタを定義します
  const Counter({super.key});

  @override
  // ウィジェットのUIを構築するメソッドです。`WidgetRef` ref を使ってプロバイダにアクセスします
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watchを使い、counterNotifierProviderの現在の状態（int型のカウンター値）を取得します
    final counter = ref.watch(counterNotifierProvider);

    // 取得した値を画面に表示するUIを構築します
    return Row(
      // 子ウィジェットを左端から配置します
      mainAxisAlignment: MainAxisAlignment.start,
      // Row内に表示するウィジェットのリストです
      children: [
        // 固定のラベルを表示するテキストウィジェットです
        Text('（geneなし）クラス NotifierProvider：'),
        // プロバイダから取得した現在のカウンター値を表示します
        Text('$counter'),
        // ウィジェット間に16ピクセルの間隔を設けます
        SizedBox(
          width: 16,
        ),
        // ボタンウィジェットを定義します
        ElevatedButton(
            // ボタンが押されたときの処理を定義します
            onPressed: () {
              // ref.readを使い、CounterNotifierのインスタンスを取得し、incrementメソッドを呼び出します
              // .notifierを付けることで、状態そのものではなく、Notifierクラスのインスタンスにアクセスできます
              ref.read(counterNotifierProvider.notifier).increment();
            },
            // ボタン内に表示するテキストです
            child: Text('+'))
      ],
    );
  }
}