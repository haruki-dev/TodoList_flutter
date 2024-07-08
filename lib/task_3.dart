import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';






class TaskPage3 extends StatefulWidget {
  const TaskPage3({super.key, required this.title});
  final String title;

  @override
  _TaskPage3State createState() => _TaskPage3State();
    }





class _TaskPage3State extends State<TaskPage3>{

  List<Map<String, Object>> todoList = [];
  // List<Map<String, Object>> _todoList = [];

  late Box<dynamic> _myBox;

  @override
  void initState(){
    super.initState();
    _myBox =  Hive.box('mybox'); 
  }


  void saveData(int index){
    // _myBox.put(index, todoList);
    _myBox.put(index, todoList[index]);
  }

  void intData(int index){
    _myBox.get(index);
    print(_myBox.get(index));
    print(_myBox.get('count0'));
    print(_myBox.get('count1'));
    print(_myBox.get('count2'));
    // print(_myBox.get(todoList[0]));
    // print(_myBox.get(todoList[1]));
    // print(_myBox.get(todoList[2]));
    // print(_myBox.get(todoList[3]));
    // print(_myBox.get(todoList[4]));
  }

  void deleteData(int index){
    _myBox.deleteAll(['count0','count1','count2']);
  }

  // void refreshData() {
  //   setState(() {
  //   // todoList.add({'text': newListText, 'done': false});
  //   // _myBox.put('text', todoList);
  //   _myBox.get('text', defaultValue: todoList);

  //   print(_myBox.get('text'));
      
  //   });
  //   // print(todoList);
  //   // print(todoList);
  //   // print(todoList);
  //   // print(_todoList);
  //   // print(_todoList);
  //   // print(_todoList);
  //   // print('これはテスト文字列です');
  //   // print('これはテスト文字列です');
  //   // print('これはテスト文字列です');
  //   // print('これはテスト文字列です');
  //   // print('これはテスト文字列です');
  //   // print(todoList.length);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('リスト追加'),
      ),
      body:ValueListenableBuilder(
        valueListenable: _myBox.listenable(),
        builder: (context,Box<dynamic> box, _){      
          return ListView.builder(
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
                      todoList[index]['text'] as String,
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
          );
        },
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
                        // deleteData(0);
                        intData(0);
                        intData(1);
                        intData(2);
                        intData(3);
            final newListText = await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context){
                  return const TaskPage3Add(initialText: '',);
                }
              )
            );
            if (newListText != null){
              setState(() {
                todoList.add({'text': newListText, 'done': false});


              });
              intData(0);
              intData(1);
              // intData(2);
              // intData(3);
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
  
  
  @override
  _TaskPage3AddState createState() => _TaskPage3AddState();

  
}



class _TaskPage3AddState extends State<TaskPage3Add> {


  String _text='';


  final _myBox =  Hive.box('mybox'); 

  void saveData() {
    _myBox.put('text', _text);
    // print(_myBox.get('saving'));
  }



    @override
  void initState() {  super.initState(); 
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
              onChanged:(String value) {
                setState(() {
                  _text = value;
                });
              },
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton (
                onPressed: () async {
                  Navigator.of(context).pop(_text);
                  saveData();
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
              floatingActionButton: FloatingActionButton(
                onPressed: (){
                  setState(() {
                  _myBox.delete('text');
                  });
                  print(_myBox.get('text'));
                },
                child: const Icon(Icons.delete),
            ),              
    );
  }
}