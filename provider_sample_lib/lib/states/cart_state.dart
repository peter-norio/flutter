import 'package:flutter/material.dart';
import 'package:provider_sample/models/item.dart';

// 買い物かごを表す状態クラス
class CartState extends ChangeNotifier {
  // 状態データを定義
  // カート内の商品リストを状態として定義
  // 状態クラスのフィールドは _ で宣言
  final List<Item> _cart = [];

  // カート内の商品リストを取得するgetter
  List<Item> get cart => _cart;

  // カート内の商品数量を取得するgetter
  int get amount => _cart.length;

  // カート内の商品合計金額を取得するgetter
  int get totalPrice {
    int total = 0;
    // カート内の商品をループして合計金額を計算
    for (final item in _cart) {
      total += item.price;
    }
    return total;
  }

  // カートに商品を追加するメソッド
  void addItem(Item item){
    _cart.add(item);
    notifyListeners();
  }
}
