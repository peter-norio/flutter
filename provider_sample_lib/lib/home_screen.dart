import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/models/item.dart';
import 'package:provider_sample/states/cart_state.dart';
import 'package:provider_sample/widgets/shopping_app_bar.dart';

// ホーム画面を表すウィジェット
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // カートに商品を追加するメソッド
  // メソッドに切り出した理由：複雑な処理をウィジェットの配置内から分離して可読性を高めるため
  void _addToCart(BuildContext context) {
    // 新しく追加するItemオブジェクトを用意
    final newItem = Item(
      // idやnameは連番にしたいので、現状カート状態の要素数＋１とする
      // readにしてる理由：状態の変更を監視する必要がなく、現時点の値が取得できれば良いため
      id: context.read<CartState>().amount + 1,
      name: '商品${context.read<CartState>().amount + 1}',
      price: 100,
    );
    // 買い物かごに商品を追加する
    // 状態クラスから提供される状態操作メソッドを利用
    context.read<CartState>().addItem(newItem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 別ファイルに切り出したAppBarウィジェットを配置
      appBar: ShoppingAppBar(),
      // 画面中央にメインコンテンツを配置
      body: Center(
        child: Column(
          // 子ウィジェットを中央に配置
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // カート内の商品数量を表示
            // 状態の変更に応じて表示を変化させるためwatchで監視
            Text('カート内商品${context.watch<CartState>().amount}個'),
            // context.selectで数量を監視する例
            Text('カート内商品${context.select<CartState, int>((cart)=>cart.amount)}個'),
            const Text('商品リスト', style: TextStyle(fontSize: 24)),
            // 商品追加のボタン
            ElevatedButton(
              // ボタン押下時に商品追加の関数を実行
              onPressed: () {
                _addToCart(context);
              },
              child: const Text('商品を追加'),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              // カート内の合計金額の表示
              child: Text(
                // 状態の変更に伴い表示の更新をするためwatchで監視
                '合計金額: ${context.watch<CartState>().totalPrice}円',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            // 商品リストを表示
            Expanded(
              child: Column(
                // childrenにmapの結果を直接指定し、繰り返し表示
                // 繰り返しの基準は状態としてるカートのリスト
                // リストの変化（商品の追加）に応じて画面を更新するのでwatchで監視
                children:
                    context
                        .watch<CartState>()
                        .cart
                        .map((item) => Text('商品名：${item.name}'))
                        .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
