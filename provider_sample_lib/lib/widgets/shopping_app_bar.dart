import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/states/cart_state.dart';

// 買い物かご画面で表示するAppBarウィジェット
// AppBarを切り出してウィジェット化する場合は、PreferredSizeWidgetインターフェースを実装する
class ShoppingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ShoppingAppBar({super.key});

  // PreferredSizeWidgetインターフェースのメソッド
  // overrideの内容は気にせずこれにする
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // AppBarのタイトル
      title: Text('Shopping Cart'),
      // 右端に買い物かごアイコンと数量を表示する
      actions: [
        Padding(
          padding: EdgeInsets.all(8.0),
          // 横に並べる
          child: Row(
            children: [
              // 買い物かごアイコン
              Icon(Icons.shopping_cart),
              // カート内の商品数
              // CartStateが提供する数量のgetterを利用
              Text('${context.watch<CartState>().amount}'),
            ],
          ),
        ),
      ],
    );
  }
}
