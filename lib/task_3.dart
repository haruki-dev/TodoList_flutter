import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';





class TaskPage3 extends StatefulWidget {


  const TaskPage3({super.key, required this.title});
  
  
  final String title;


  @override
  _TaskPage3State createState() => _TaskPage3State();


}





class _TaskPage3State extends State<TaskPage3>{



  late List<Map<String, dynamic>> todoList = [];
  // late List<Map<dynamic,dynamic>> ?todoList = [];
  
  
  // List<String, bool> todoList = [];



  // Box<List<Map<String, Object>>> _myBox;
  late Box<dynamic> _myBox;
  // late Box<List<Map<String, Object>>> _myBox = [];
  // late List<Map<String, Object>> _myBox = [];

// F5でデバッグします。

  @override
  void initState(){
    super.initState();
    _myBox =  Hive.box('mybox'); 
    setState(() {
      loadTodoList(); 
    // _myBox!.get('mybox')!  ;
    // todoList = _myBox!.get('mybox')!  ;
    // __TypeErrormyBox.get('mybox') ;
    });
    // print(_myBox.get('mybox'));
  }

void loadTodoList() {
  final dynamic rawData = _myBox.get('mybox');
  if (rawData != null && rawData is List) {
    setState(() {
      todoList = (rawData as List)
          .where((item) => item is Map<String, dynamic>)
          .cast<Map<String, dynamic>>()
          .toList();
    });
  } else {
    setState(() {
      todoList = [];
    });
  }
}

  // void loadTodoList(){
  //   final dynamic rawData = _myBox.get('mybox');
  //   if (rawData != null && rawData is List) {
  //     setState(() {
  //       todoList = rawData.map((item) {
  //         if (item is Map<String, dynamic>) {
  //           return item;
  //         } else {
  //           // 必要に応じて、itemを適切なMap<String, dynamic>に変換するロジックを追加
  //           return null;
  //         }
  //       }).toList();
  //     });
  //   } 
  // }
    // else {
    //   setState(() {
    //     todoList = [];
    //   });
    // }
  // @override
  // void createState(){
  //   super.createState();
  // }



  void overRideData(){
    _myBox.put('mybox', todoList);
  }



  void deleteData(){
    _myBox.delete('mybox');
  }



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
            itemBuilder: (BuildContext context, index){
              
              
              _myBox.get('mybox');
              print(todoList.length);
              print(todoList[index]['done']);
              print(todoList[index]['text']);
              print(_myBox.get('mybox'));

              // final String name = todoList[index]['text'] as String;
              // final bool listbool = todoList[index]['done'] as bool;
              // print(name);
              // print(listbool);


              return Card(
                child: ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.circle,
                    color: (
                      todoList[index]['done'] as bool) ? Colors.green : Colors.grey,
                      // listbool) ? Colors.green : Colors.grey,
                      ),
                    onPressed: (){
                      setState(() {
                        todoList[index]['done'] = !(todoList[index]['done'] as bool);
                        // listbool == !(listbool);
                        overRideData();
                      });
                    },
                  ),
                  title:Text(
                      todoList[index]['text'] as String,
                      // name,
                      style: TextStyle(
                      color: (todoList[index]['done'] as bool) ? Colors.grey : Colors.black,
                      // color: (listbool) ? Colors.grey : Colors.black,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: (){
                      setState(() {
                        todoList.removeAt(index);
                        overRideData();
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
            final newListText = await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context){
                  return const TaskPage3Add(initialText: '',);
                }
              )
            );
            if (newListText != ''){
              setState(() {
                todoList.add({ 'text': newListText, 'done': false});
                overRideData();
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
  
  
  @override
  _TaskPage3AddState createState() => _TaskPage3AddState();

  
}





class _TaskPage3AddState extends State<TaskPage3Add> {


  String _text='';


  final _saveText =  Hive.box('text'); 


  void saveData() {
    _saveText.put('text', _text);
    // print(_myBox.get('saving'));
  }


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
                  if ( _text != ''){
                  Navigator.of(context).pop(_text);
                  saveData();
                  }
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
                  _saveText.delete('text');
                  });
                },
                child: const Icon(Icons.delete),
            ),              
    );
  }
}