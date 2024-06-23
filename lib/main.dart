import 'package:flutter/material.dart';
// import 'classes.dart';
import 'task_1.dart';
import 'task_2.dart';
import 'task_3.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(
        title: 'Flutter進捗報告用'),
      routes: {
        "/task_1": (BuildContext context) => const TaskPage1(),
        "/task_2": (BuildContext context) => const TaskPage2(),
        "/task_3": (BuildContext context) => const TaskPage3(title:'TodoList'),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        // body: const Center( 
        body:  Stack( 
          children: [
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: const Text('\\ｺﾝﾆﾁﾊ/',),
                  ),
                ]
              ),
              const Image(
                image:AssetImage('assets/Myicon.png')
              ),
              // Image.network('https://icon-pit.com/wp-content/uploads/2020/10/music_headphone_14822.png'),
              // Image(
              //   image:AssetImage('assets/Myicon.png')
              // ),
            ]
          ),
          ]
        ),
        drawer: Drawer(
          child: ListView(
          children: [
            const ListTile(
              title: Text(
                "flutter勉強会 課題進捗報告用",
                  style: TextStyle(
                    fontWeight: FontWeight.w600
                  ),
                ),
            ),
            const SizedBox(
              height: 20.0,
              width: double.infinity),
            ListTile(
              title: const Text(
                "課題1 \r\n テキスト切替ボタンを作ってみよう",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              onTap: () => {
                Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context){
                    return const TaskPage1();
                  }))
              },
            ),
            const SizedBox(
              height: 10.0,
              width: double.infinity),
            ListTile(
              title: const Text(
                "課題2 \r\n 画面遷移の処理をroute:を使わずに実装してみよう（サイドバー部分がroute:）",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              onTap: (){
                Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context){
                    return const TaskPage2();
                  }));
              },
            ),
            const SizedBox(
              height: 10.0,
              width: double.infinity),
            ListTile(
              title: const Text(
                "課題3 \r\n ToDoアプリを作ってみよう",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              onTap: (){
                Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context){
                    return const TaskPage3(title: 'TodoList',);
                  }));
              },
            ),
            const SizedBox(
              height: 10.0,
              width: double.infinity),
          ],
        ),
      ),
    );
  }
}






























































































// // 1. エントリーポイントのmain関数
// void main() {
//   // 2. MyAppを呼び出す
//   runApp(const MyApp());
// }
// // MyAppのクラス
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // 3. タイトルとテーマを設定する。画面の本体はMyHomePageで作る。
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const Sample(
//         title: 'Greeting switching app'),
//     );
//   }
// }

// // 描画処理部分。classes.dartに外出しも可能。
// // その場合、2行目の処理を有効にする。
// class Sample extends StatefulWidget {
//   const Sample({super.key, required this.title});
//   final String title;

//   @override
//   State<Sample> createState() => _SampleState();
// }

// // import、main関数、MyApp、MyHomePageはデフォルトから変更がないため省略

// class _SampleState extends State<Sample> {
//   bool _showHi = true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//         ),
//         body:Center( 
//           child:Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               _showHi ? Text('Hi') : Text('Bye'),
//               SizedBox(height: 20),
//             ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     _showHi = !_showHi; // 表示状態を切り替える
//                   });
//                 },
//                 child: Text('switch'),
//             ),
//         ])));
//   }
// }
