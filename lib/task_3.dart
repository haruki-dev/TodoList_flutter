import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

// late Box box;

class TaskPage3 extends StatefulWidget {
  const TaskPage3({super.key, required this.title});
  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _TaskPage3State createState() => _TaskPage3State();
    }

class _TaskPage3State extends State<TaskPage3>{

  List<Map<String, Object>> todoList = [];
  // final List<bool> _todoListStates = List.filled(todoList.length, false); 
  final myBox =  Hive.box('mybox');
  // @override

  // void initState(){
  //   super.initState();
  //   _initHive();
  // }

  // void _initHive() {
  //   // await Hive.initFlutter();
  // }
  
  void _loadData() {
    todoList = myBox.get('mybox');
  }


  void _saveData() {
    todoList = myBox.put('mybox',todoList) as List<Map<String, Object>>;
  }

  // Future<void> textGet()async {
  //   // box = await Hive.openBox('mybox');
  //   final todoList =  await box.get('mybox', defaultValue:todoList);
  //   setState(() {
  //     todoList;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // todoList = box.get('mybox', defaultValue: todoList[index]['text'] as String,);
    // todoList = box.get('mybox', defaultValue:'' as List);

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
                color: (todoList[index]['done'] as bool) ? Colors.green : Colors.grey,
                  ),
                onPressed: (){
                  setState(() {
                    todoList[index]['done'] = !(todoList[index]['done'] as bool);
                  });
                },
              ),
              title:Text(
                // _mybox.get('mybox',
                // defaultValue: todoList[index]['text'] as String,
                // defaultValue: ''_text
                todoList[index]['text'] as String,
                // ),
                style: TextStyle(
                  color: (todoList[index]['done'] as bool) ? Colors.grey : Colors.black,
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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final newListText = await Navigator.of(context).push(
              MaterialPageRoute(builder: (context){
                return const TaskPage3Add(initialText: '',);
                })
              );
              // String _text='';
          if (newListText != null){
            setState(() {
            todoList.add({'text': newListText, 'done': false});
            todoList;
            // _mybox.put('mybox', _text);
            });
          }
          },
          child:const Icon(Icons.add),
        ),
    );
  }
}

class TaskPage3Add extends StatefulWidget{

  final String  initialText;
  const TaskPage3Add({super.key, required this.initialText});
  // const TaskPage3Add({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _TaskPage3AddState createState() => _TaskPage3AddState();
    }



class _TaskPage3AddState extends State<TaskPage3Add> {

  String _text='';

  // final TaskPage3 aaa;

  // _TaskPage3AddState(this.aaa);

    @override
  void initState() {  
  super.initState(); 
  _text = widget.initialText;
  }

  void textSave(){
    Navigator.of(context).pop(_text);
    setState(() {
      // _mybox.put('mybox', _text);
    });
  }


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
            Text(_text, style: const TextStyle(color: Colors.blue)),
            const SizedBox(height: 8),
            TextField(
              onChanged: (String value) {
                setState(() {
                  _text = value;

                  // _mybox.put('text', _text);
                });
              },
            ),
            // ignore: sized_box_for_whitespace
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(_text);
                  setState(() {
                  // todoList;
                  });
                },
                child: const Text('リスト追加', style: TextStyle(color: Colors.black)),
                  // _text = value;
                  // _mybox.put('mybox', _text);
                  // textSave();
                  // Navigator.of(context).pop(_text);
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
          ],
        ),
      ),
    );
  }
}