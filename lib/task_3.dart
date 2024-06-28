import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

late Box box;

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
  @override
  void initState() {
    super.initState();
    _initHive();
  }
  Future<void> _initHive() async {
    await Hive.initFlutter();
    box = await Hive.openBox('box1');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('リスト追加'),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index){
          String _text = '';
          _text = box.get('text', defaultValue:'');
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
                box.get('box1',
                // defaultValue: _text
                defaultValue: todoList[index]['text'] as String,
                ),
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
            // box.put('box1', _text);
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

    @override
  void initState() {  
  super.initState(); 
  _text = widget.initialText;
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
                  // box.put('text', _text);
                });
              },
            ),
            // ignore: sized_box_for_whitespace
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // _text = value;
                  box.put('box1', _text);
                  Navigator.of(context).pop(
                    _text
                    );
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
          ],
        ),
      ),
    );
  }
}