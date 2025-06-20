// 手順２（赤波線の上で cmd + . で補完可能）
// Riverpodをインポート：Ref型のコンパイルエラーを解消
import 'package:flutter_riverpod/flutter_riverpod.dart';
// アノテーションをインポート：@riverpodのコンパイルエラーを解消
import 'package:riverpod_annotation/riverpod_annotation.dart';

// 手順３
// 「riverpodpart」と入力し補完でpart構文を入力
// なお「xxx.g.dart」ファイルはコード生成により用意するため、書いた直後はコンパイルエラーとなる
part 'hello_provider.g.dart';

// 手順１
// 「riverpod」と入力し補完から「Riverpod simple instance」を選択
// 補完で入力された雛形の戻り値型、関数名、戻り値を修正
@riverpod
String hello (Ref ref) {
  return 'hello';
}
