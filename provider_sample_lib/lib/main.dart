import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/home_screen.dart';
import 'package:provider_sample/states/cart_state.dart';

// アプリのエントリーポイント
void main() {
  runApp(
    // プロバイダーを通して状態を共有
    ChangeNotifierProvider(
      // 状態オブジェクトを返す関数を指定
      create: (context) => CartState(),
      // 状態を共有するウィジェット（ルートを指定）
      child: const MyApp()),
  );
}

// ルートウィジェット
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomeScreen(),
    );
  }
}
