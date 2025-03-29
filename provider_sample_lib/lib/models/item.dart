// 商品を表すモデルクラス
class Item {
  // フィールドは型を明示する
  final int id;
  final String name;
  final int price;

  // コンストラクタは名前付き引数で分かりやすく
  Item({
    required this.id, 
    required this.name, 
    required this.price
  });
}
