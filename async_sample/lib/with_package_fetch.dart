import 'dart:convert';
import 'package:async_sample/item.dart';
import 'package:http/http.dart' as http;


// GETリクエストを送信して結果をData型リストで返却する
Future<List<Item>> sendGetReqest2() async {
  // 送信先URLを準備
  final url = Uri.parse('http://localhost:3000/sample'); // その他
  // final url = Uri.parse('http://10.0.2.2:3000/sample'); // Android

  // GETリクエストを送信（非同期）
  final response = await http.get(url);

  // // ステータスコードを確認
  // if (response.statusCode == 200) {
  final json = response.body; // String型
  final rawList = jsonDecode(json); // List<dynamic>型
  final itemList =
      rawList.map<Item>((json) => Item.fromJson(json)).toList(); // List<Data>型
  // } else {
  //   通信失敗時の処理;
  // }
  print(itemList);
  return itemList;
}

// POSTリクエストを送信
Future<void> sendPostReqest2() async {
  // 送信先URLを準備
  final url = Uri.parse('http://localhost:3000/sample');
  // Content-Typeヘッダーを準備
  final headers = {'Content-Type': 'application/json'};
  // 送信データの元になるオブジェクトを用意
  // final data = Data(id: '5', title: 'fivefive');
  final item = Item(id: 5, title: 'fivefive');

  // POSTリクエストを送信（非同期）
  final response = await http.post(
    url,
    headers: headers,
    // JSONにエンコードしてボディに指定
    body: jsonEncode(item.toJson()),
  );
}

