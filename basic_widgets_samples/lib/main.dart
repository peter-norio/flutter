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
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ],
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: [
          Icon(Icons.favorite, color: Colors.pink, size: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/screen_shot.png', height: 50),
              Image.network(
                fit: BoxFit.fill,
                width: 200,
                'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiDZXOmYQwj6D4cM5beEMORXxl9wj1b_j_-Y-MjuhpDg2VroOp7iOfEH12rsgO4eJwpHcwL_XGwk6QmdXhyphenhyphencuNy6VWwE1_oXYnIJFWIQ-Q5uphF5GvVd6lyp5hwhxexTFzQu7IQJcl6fxng/s400/buranko_boy_smile.png',
                height: 50,
              ),
            ],
          ),
          Text('文字を表示'),
          Text(
            'これは、非常に長いテキストの例です。指定された領域に収まりきらない場合に、どのようにテキストが処理されるかを示すために、意図的に長くしています。フォントサイズ、色、太さ、配置、そして行数制限とオーバーフローの挙動に注目してください。',
            style: TextStyle(
              fontSize: 18.0, // 文字の大きさ
              color: Colors.blue, // 文字の色
              fontWeight: FontWeight.bold, // 文字の太さ
            ),
            textAlign: TextAlign.center, // テキスト全体を領域内で中央揃え
            maxLines: 4, // 最大表示行数を4行に制限
            overflow: TextOverflow.ellipsis, // 4行を超えた場合は「...」で省略
          ),
          Container(height: 50, width: 50, child: Placeholder()),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 50,
                height: 50,
                color: Colors.green,
                child: Text('col1'),
              ),
              Container(
                width: 50,
                height: 50,
                color: Colors.green,
                child: Text('col2'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 50,
                height: 50,
                color: Colors.grey,
                child: Text('Row1'),
              ),
              Container(
                width: 50,
                height: 50,
                color: Colors.grey,
                child: Text('Row2'),
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            height: 50,
            width: 100,
            decoration: BoxDecoration(border: Border.all()),
            child: Text('中央に配置'),
          ),
          Container(
            color: Colors.amber,
            height: 50,
            width: 50,
            child: Text('data'),
          ),
          Container(
            color: Colors.red,
            height: 50,
            width: 50,
            child: Text('data'),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              // 背景色
              backgroundColor: Colors.blue,
              // 文字色
              foregroundColor: Colors.yellow,
              // 空白
              padding: EdgeInsets.all(10),
              // 枠線
              side: BorderSide(color: Colors.red, width: 5), 
            ),
            child: Text('styled'),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(title: Text('ElevatedButton'));
                },
              );
            },
            onLongPress: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(title: Text('LongPress'));
                },
              );
            },
            child: const Row(
              // Rowが子にフィットするように最小限のサイズにする
              mainAxisSize: MainAxisSize.min,
              children: [Icon(Icons.star), Text('ElevatedButton()')],
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(title: Text('ElevatedButton.icon'));
                },
              );
            },
            icon: const Icon(Icons.star),
            label: const Text('ElevatedButton.icon()'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('FAB'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text('DrawerHeader')),
            ListTile(title: Text('ListTitle1')),
            ListTile(title: Text('ListTitle2')),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
        ],
      ),
    );
  }
}
