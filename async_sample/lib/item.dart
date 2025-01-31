import 'package:json_annotation/json_annotation.dart';

// 生成されたコードを取り込む
// この記述をコード生成前に記述しないとコード生成されない
part 'item.g.dart';

// コード生成の対象とするためのアノテーション
@JsonSerializable()
class Item {
  final int id;
  final String title;

  Item({required this.id, required this.title});

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
