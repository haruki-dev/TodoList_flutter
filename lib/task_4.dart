import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';





class TaskPage4 extends StatefulWidget {


  const TaskPage4({super.key, required this.title});
  
  
  final String title;


  @override
  _TaskPage4State createState() => _TaskPage4State();


}





class _TaskPage4State extends State<TaskPage4>{



  late List<Map<String, dynamic>> todoList = [];

  late Box<dynamic> _myBox;



  @override
  void initState(){
    super.initState();
    _myBox =  Hive.box('mybox'); 
    setState(() {
      loadTodoList(); 
    });
  }



  void loadTodoList() {
    final dynamic rawData = _myBox.get('mybox');
    if (rawData != null && rawData is List) {
      List<Map<String, dynamic>> mapList = rawData.map((item) {
        return Map<String, dynamic>.from(item);
      }).toList();
      setState(() {
        todoList = mapList;
      });
    } else {
      setState(() {
        todoList = [];
      });
    }
  }



  void overRideData(){
    _myBox.put('mybox', todoList);
  }



  void deleteData(){
    _myBox.delete('mybox');
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        backgroundColor:Colors.blueGrey[900] ,
        centerTitle: true,
        title: const Text(
          'Carousel_App',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 14
          ),),
      ),
      body:Container(
        child: Column(
          children: [
            SizedBox(
              height: 10,
              width: double.infinity,
            ),
            CarouselSlider(
              options: CarouselOptions(height: 100.0),
              items: [1,2,3,4,5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 2.0),
                      decoration:  BoxDecoration(
                        color: Colors.blueGrey[700]
                      ),
                      child: Text('memo $i', style: TextStyle(fontSize: 12.0),)
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(
              height: 10,
              width: double.infinity,
            ),
            CarouselSlider(
              options: CarouselOptions(height: 100.0),
              items: [1,2,3,4,5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 2.0),
                      decoration:  BoxDecoration(
                        color: Colors.blueGrey[700]
                      ),
                      child: Text('memo $i', style: TextStyle(fontSize: 12.0),)
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(
              height: 10,
              width: double.infinity,
            ),
            CarouselSlider(
              options: CarouselOptions(height: 100.0),
              items: [1,2,3,4,5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 2.0),
                      decoration:  BoxDecoration(
                        color: Colors.blueGrey[700]
                      ),
                      child: Text('memo $i', style: TextStyle(fontSize: 12.0),)
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(
              height: 10,
              width: double.infinity,
            ),
            CarouselSlider(
              options: CarouselOptions(height: 100.0),
              items: [1,2,3,4,5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 2.0),
                      decoration:  BoxDecoration(
                        color: Colors.blueGrey[700]
                      ),
                      child: Text('memo $i', style: TextStyle(fontSize: 12.0),)
                    );
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey[900],
        selectedItemColor: Colors.white70,
        
        
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            ),
        ],
        selectedLabelStyle: TextStyle(fontSize: 10 ),
        unselectedLabelStyle: TextStyle(fontSize: 10),
      ),
      
        
      
    );
  }
}