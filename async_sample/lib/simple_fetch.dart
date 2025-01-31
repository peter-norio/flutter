import 'dart:convert';
import 'package:http/http.dart' as http;

// JSONに対応するクラス
class Data {
  final int id;
  final String title;

  // 通常のコンストラクタ
  Data({required this.id, required this.title});

  // デコードしたJSONからインスタンスを生成するコンストラクタ
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      title: json['title'],
    );
  }

  // インスタンスをMap<String, dynamic>型に変換
  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title};
  }
}

// GETリクエストを送信して結果をData型リストで返却する
Future<List<Data>> sendGetReqest() async {
  // 送信先URLを準備
  final url = Uri.parse('http://localhost:3000/sample'); // その他
  // final url = Uri.parse('http://10.0.2.2:3000/sample'); // Android

  // GETリクエストを送信（非同期）
  final response = await http.get(url);

  // // ステータスコードを確認
  // if (response.statusCode == 200) {
  final json = response.body; // String型
  final rawList = jsonDecode(json); // List<dynamic>型
  final dataList =
      rawList.map<Data>((json) => Data.fromJson(json)).toList(); // List<Data>型
  // } else {
  //   通信失敗時の処理;
  // }
  print(dataList);
  return dataList;
}

// POSTリクエストを送信
Future<void> sendPostReqest() async {
  // 送信先URLを準備
  final url = Uri.parse('http://localhost:3000/sample');
  // Content-Typeヘッダーを準備
  final headers = {'Content-Type': 'application/json'};
  // 送信データの元になるオブジェクトを用意
  final data = Data(id: 5, title: 'fivefive');

  // POSTリクエストを送信（非同期）
  final response = await http.post(
    url,
    headers: headers,
    // JSONにエンコードしてボディに指定
    body: jsonEncode(data.toJson()),
  );
}

// Future<void> convert(String sentence) async {
//   state = const Loading();
//   final url = Uri.parse('https://labs.goo.ne.jp/api/hiragana');
//   final headers = {'Content-Type': 'application/json'};
//   final request = Request(
//     appId: const String.fromEnvironment('appId'),
//     sentence: sentence,
//   );
//   final response = await http.post(
//     url,
//     headers: headers,
//     body: jsonEncode(request.toJson()),
//   );
//   final result = Response.fromJson(
//     jsonDecode(response.body) as Map<String, Object?>,
//   );
//   state = Data(result.converted);
// }
