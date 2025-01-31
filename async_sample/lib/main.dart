import 'package:async_sample/simple_fetch.dart';
import 'package:async_sample/with_package_fetch.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            onPressed: () => sendGetReqest(),
            child: const Text('GETリクエスト'),
          ),
          ElevatedButton(
            onPressed: () => sendPostReqest(),
            child: const Text('POSTリクエスト'),
          ),
          ElevatedButton(
            onPressed: () => sendGetReqest2(),
            child: const Text('GETリクエスト2'),
          ),
          ElevatedButton(
            onPressed: () => sendPostReqest2(),
            child: const Text('POSTリクエスト2'),
          )
        ]),
      ),
    );
  }
}
