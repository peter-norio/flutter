import 'package:flutter/material.dart';
// Riverpodをインポート
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_riverpod/hello_box.dart';

void main() {
  // runAppの引数にProviderScopeを配置
  runApp(ProviderScope(child: const MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // ConsumerWidgetは通常のウィジェットと同じように配置
      home: const HelloBox(),
    );
  }
}

