// FlutterのUIウィジェット（この場合はCupertinoスタイル）をインポートします
import 'package:flutter/cupertino.dart';
// Riverpodの状態管理機能を利用するためにインポートします
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 'Hello Flutter'という文字列を提供する、最もシンプルなProviderを定義します
final helloProvider = Provider((ref) {
  // このプロバイダが提供する値を返します
  return 'Hello Flutter';
});

// Providerの値を読み取るためのウィジェットを定義します
// ConsumerWidgetを継承することで、buildメソッド内で`WidgetRef`が使えるようになります
class Hello extends ConsumerWidget {
  // このウィジェットのコンストラクタを定義します
  const Hello({super.key});

  @override
  // ウィジェットのUIを構築するメソッドです。`WidgetRef` ref を使ってプロバイダにアクセスします
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watchを使い、helloProviderの現在の値（'Hello Flutter'）を取得します
    final hello = ref.watch(helloProvider);
    
    // 取得した値を画面に表示するUIを構築します
    return Row(
      // 子ウィジェットを左端から配置します
      mainAxisAlignment: MainAxisAlignment.start,
      // Row内に表示するウィジェットのリストです
      children: [
        // 固定のラベルを表示するテキストウィジェットです
        Text('（geneなし）関数 Provider：'),
        // プロバイダから取得した値を表示するテキストウィジェットです
        Text(hello),
      ],
    );
  }
}