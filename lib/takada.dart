// import 'package:flutter/material.dart';

// class TodoListPage extends StatefulWidget {

// @override
// _TodoListPageState createState() => _TodoListPageState();
// } 


// class _TodoListPageState extends State<TodoListPage> {
// List<Map<String, Object>> todoList = [];

// @override
// Widget build(BuildContext context) {
  
//   return Scaffold(
//   appBar: AppBar(
//     title: const Text('リスト一覧'),
//   ),

//   body: ListView.builder(
//     itemCount: todoList.length, 
//     itemBuilder: (context, index) {
//       return Card(
//         child: ListTile(
//               leading: IconButton(
//                   icon: Icon(
//         Icons.circle,
//               color: (todoList[index]['done'] as bool)
//                           ? Colors.green 
//           : Colors.grey,
//         ), 
//                   onPressed: () {
//               setState(() {
//                         todoList[index]['done'] =     !(todoList[index]['done'] as bool);
//         }); 
//         }, 
//       ),
//           title: Text(
//         todoList[index]['text']
//           as String, 
//             style: TextStyle(
//         color: (todoList[index]['done'] as bool)
//           ? Colors.grey 
//           : Colors.black, 
//         ),
//       ),
//       subtitle: const Text('subtitle'),
//           trailing: Row(
//             mainAxisSize: MainAxisSize.min, 
//             children: <Widget>[
//         IconButton(
//           icon: const Icon(Icons.edit, color: Colors.blue),
//           onPressed: () async {
//                   final editedText = await Navigator.of(context).push(
//                     MaterialPageRoute(builder: (context) {
//             return TodoEditPage(
//                           initialText: todoList[index]['text'] as String);
//             }), 
//           );
//                   if (editedText != null) {
//                     setState(() {
//                       todoList[index]['text'] = editedText;
//                       });
//           }
//           },
//         ),
//               IconButton(
//           icon: const Icon(Icons.clear, color: Colors.grey),
//           onPressed: () {
//           setState(() {
//             todoList.removeAt(index);
//                               });
//           },
//           ),
//         ],
//         ),
//       ),
//       );
//     },
//     ),
//     floatingActionButton: FloatingActionButton(
//     onPressed: () async {
//             final newListText = await Navigator.of(context).push(
//             MaterialPageRoute(builder: (context) {
//             return TodoAddPage();
//       }),
//       );
//       if (newListText != null) {
//             setState(() {
//             todoList.add({'text': newListText, 'done': false});
//           });
//       }
//     },
//     child: const Icon(Icons.add),
//     ),
//   );
//   }
// }

// import 'package:flutter/material.dart';

// class TodoAddPage extends StatefulWidget {
//   @override
//   _TodoAddPageState createState() => _TodoAddPageState();
// } 


// class _TodoAddPageState extends State<TodoAddPage> {
  
  
  
//   String _text = '';
  
//   @override
//   Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//     title: const Text('リスト追加'),
//     ),
//     body: Container(
//       padding: const EdgeInsets.all(64), 
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//           Text(_text, style: const TextStyle(color: Colors.blue)),
//       const SizedBox(height: 8),
//           TextField(
//             onChanged: (String value) {
//               setState(() {
//                 _text = value;
//         });
//         },
//       ),
//       const SizedBox(height: 8),
//       Container(
//             width: double.infinity,

//         child: ElevatedButton(
//         onPressed: () {
//                       Navigator.of(context).pop(_text);
//         },
//         child:
//           const Text('リスト追加', style: TextStyle(color: Colors.purple)),
//         ),
//       ),
//       const SizedBox(height: 8),
//       Container(
//             width: double.infinity,
//             child: TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//         },
//         child: const Text('キャンセル'),
//         ),
//       ),
//       ],
//     ),
//     ),
//   );
//   }
// }

// class TodoEditPage extends StatefulWidget {
//   final String initialText; 
  
//   TodoEditPage({required this.initialText});

//   @override
//   _TodoEditPageState createState() => _TodoEditPageState();
// } 
// class _TodoEditPageState extends State<TodoEditPage> {
  
//   late String _text;

//   @override
//   void initState() {
  
//   super.initState(); 
//   _text = widget.initialText;
  
//   }
//   @override
//   Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//     title: const Text('リスト編集'),
//     ),
//     body: Container(
//     padding: const EdgeInsets.all(64),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//       Text(_text, style: const TextStyle(color: Colors.blue)),
//       const SizedBox(height: 8),
//       TextField(
//             onChanged: (String value) {
//               setState(() {
//                 _text = value;
//         });
//         },
//       ),
//       const SizedBox(height: 8),
//       Container(
//             width: double.infinity,
//             child: ElevatedButton(
//         onPressed: () {
//           Navigator.of(context).pop(_text);
//         },
//         child:
//           const Text('リスト更新', style: TextStyle(color: Colors.purple)),
//         ),
//       ),
//       const SizedBox(height: 8),
//       Container(
//         width: double.infinity,
//         child: TextButton(
//         onPressed: () {
//           Navigator.of(context).pop();
//         },
//         child: const Text('キャンセル'),
//         ),
//       ),
//       ],
//     ),
//     ),
//   );
//   }
// }