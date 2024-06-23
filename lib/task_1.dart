import 'package:flutter/material.dart';

class TaskPage1 extends StatelessWidget {
    const TaskPage1({super.key});
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        title: 'task_1',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
      ),
        home: const SwitchTask(
          title: '挨拶して！'),
        );
  }
}

class SwitchTask extends StatefulWidget {
  const SwitchTask({super.key, required this.title});
  final String title;

  @override
  State<SwitchTask> createState() => _SwitchTaskState();
}

class _SwitchTaskState extends State<SwitchTask> {
  bool _showHi = true;
  bool _changeButton = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // テキスト描画箇所
            _showHi ? const Text('Hi') : const Text('Bye'),
            const SizedBox(height: 20),

            // ボタン描画箇所（テキストが変わらないパターン）
            // ElevatedButton(
            //   onPressed: () {
            //     setState(() {
            //       _showHi = !_showHi;
            //     });
            //   },
            //   child: Text('Hi'),
            // ),
            // SizedBox(height: 20),
            
            // ボタンテキストも変わるパターン
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _showHi = !_showHi;
                  _changeButton = !_changeButton;
                });
              },
              child: Text(_changeButton ? 'Bye' : 'Hi'), 
            ),
            const SizedBox(height: 20),
            
          ],
        ),
      ),
    );
  }
}