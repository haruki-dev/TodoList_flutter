import 'package:flutter/material.dart';

class TaskPage3 extends StatefulWidget {
  const TaskPage3({super.key, required this.title});
  final String title;
  
  @override
  // ignore: library_private_types_in_public_api
  _TaskPage3State createState() => _TaskPage3State();
    }

class TodoItem{
  String text;
  bool done;

  TodoItem(this.text,this.done);
}


class _TaskPage3State extends State<TaskPage3>{
  List<String> todoList = [];
  // final Color<bool> _iconColor = false;
  // final Color<bool> _textColor = false;
  final List<bool> _todoListStates = List.filled(todoList.length, false); 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('リスト追加'),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              leading: IconButton(
                icon: Icon(Icons.circle,
                  color: _todoListStates[index] ? Colors.grey : Colors.green,
                  
                  // color: _todoListStates,
                  ),
                onPressed: (){
                  setState(() {
                    _todoListStates[index] = !_todoListStates[index];
                  });
                    
                    // todoList[index];
                    //   _iconColor = _iconColor == Colors.blue ? Colors.grey : Colors.blue;
                    //   _textColor = _textColor == Colors.black ? Colors.grey : Colors.black;
                },
              ),
              title:Text(
                ("$index : ${todoList[index]}"),
                style: TextStyle(
                  // color: _textColor
                  ),
                  ),
              trailing: IconButton(
                icon: const Icon(Icons.close),
                onPressed: (){
                  setState(() {
                    todoList.removeAt(index);
                  });
                } ,
              ),
            ),
          );
        },
        padding: const EdgeInsets.all(32),
      ),
      // return Text(todoList[index]);
      
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final newListText = await
              Navigator.of(context)
              .push(MaterialPageRoute(builder: (context){
                return const TaskPage3Add();
                })
              );
          if (newListText != null){
            setState(() {
              todoList.add(newListText);
            });
          }
          },
        //   onPressed:{
        //       Navigator.of(context)
        //       .push(MaterialPageRoute(builder: (context){
        //         return const TaskPage3Add();
        //         })
        //       );
        //   if (newListText != null){
        //     setState(() {
        //       todoList.add(newListText);
        //     });
          child:const Icon(Icons.add),
        ),
    );
  }
}

class TaskPage3Add extends StatefulWidget{
  const TaskPage3Add({super.key});


  @override
  // ignore: library_private_types_in_public_api
  _TaskPage3AddState createState() => _TaskPage3AddState();
    }



class _TaskPage3AddState extends State<TaskPage3Add> {

  String _text='';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('リスト追加'),
        ),
        body: Container(
                  padding: const EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 入力されたテキストを表示
            Text(_text, style: const TextStyle(color: Colors.blue)),
            const SizedBox(height: 8),
            TextField(
              onChanged: (String value) {
                setState(() {
                  _text = value;
                });
              },
            ),
            // ignore: sized_box_for_whitespace
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(_text);
                },
                child: const Text('リスト追加', style: TextStyle(color: Colors.black)),
              ),
            ),
            const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('キャンセル'),
                ),
              ),
            // TextField(
            //   onChanged: (text) {
            //     // setState(() {
            //     //   _text = value;
            //     // }
            //     // );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}