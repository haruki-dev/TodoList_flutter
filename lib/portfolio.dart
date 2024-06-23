import 'package:flutter/material.dart';

class TaskPage21 extends StatelessWidget {
  const TaskPage21({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children:<Widget> [
          Expanded(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 500,
                  height: 80,
                  color: Colors.white,
                ),
                Container(
                  width: 300,
                  height: 250,
                  color: Colors.white,
                  child:Center(
                      child:SizedBox(                      
                      width:300,
                      height:300,
                      child: Image.asset('assets/kanu.jpg') ,
                    ),
                  ),
                ),
                Container(
                color: Colors.white,
                child:OutlinedButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  }, 
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(30, 30),
                    shape: const LinearBorder(
                      side: BorderSide(
                        color: Colors.black
                        ),
                      start: LinearBorderEdge(),
                      end: LinearBorderEdge(),
                    )
                  ),
                  child:const Text(
                    'お家へ帰るんだな、坊主'
                  ),
                ),
              ),
            ]
          ),
          ),
        ]
      ),
    );
  }
}

      // return MaterialApp(
      //   title: 'task_2_1',
      //   theme: ThemeData(
      //     primarySwatch: Colors.blueGrey,
      // ),
      //   home: const MyPortfolio1(
      //     title: ''),
        // );

// class MyPortfolio1 extends StatefulWidget {
//   const MyPortfolio1({super.key, required this.title});
//   final String title;

//   @override
//   State<MyPortfolio1> createState() => _MyPortfolio1State();
// }

// class _MyPortfolio1State extends State<MyPortfolio1> {

//   @override
//   Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Row(
    //           children:<Widget> [
    //             Expanded(
    //               child:Column(
    //                 mainAxisAlignment: MainAxisAlignment.start,
    //                 children: [
    //                   Container(
    //                     width: 500,
    //                     height: 80,
    //                     color: Colors.white,
    //                   ),
    //                   Container(
    //                     width: 300,
    //                     height: 250,
    //                     color: Colors.white,
    //                     child:Center(
    //                         child:SizedBox(                      
    //                         width:300,
    //                         height:300,
    //                         child: Image.asset('assets/kanu.jpg') ,
    //                       ),
    //                     ),
    //                   ),
    //                           Container(
    //                           // width: double.infinity,
    //                           // height: 100,
    //                           color: Colors.white,
    //                           // child:Center(
    //                           // OutlinedButton(
    //                           child:OutlinedButton(
    //                             onPressed: (){
    //                               Navigator.of(context).pop();
    //                           }, 
    //                             style: OutlinedButton.styleFrom(
    //                               minimumSize: const Size(30, 30),
    //                               shape: const LinearBorder(
    //                                 side: BorderSide(
    //                                   color: Colors.black
    //                                   ),
    //                                 start: LinearBorderEdge(),
    //                                 end: LinearBorderEdge(),
    //                               )
    //                             ),
    //                             child:const Text('お家へ帰るんだな、坊主'),
    //                           ),
    //                           ),
    //               ]
    //             ),
    //             ),
    //           ]
    //         ),
    //   );
//   }
// }