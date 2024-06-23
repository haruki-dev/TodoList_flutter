import 'package:flutter/material.dart';
import 'portfolio.dart';

class TaskPage2 extends StatelessWidget {
    const TaskPage2({super.key});
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
                    child:ClipOval(
                      child:SizedBox(                      
                      width:150,
                      height:150,
                      child: Image.asset('assets/pan.jpg') ,
                      ),
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Container(
                      width:60,
                      height:300,
                      color: Colors.white,
                    ),
                    Container(
                      width:270,
                      height:300,
                      color: Colors.white,
                      child: const Text(
                        'Takahiro_Miyoshi\r\n1997年山形県生まれ。\r\n何よりも塩パンが大好き。\r\n週末は地元のパン屋に一番乗りで駆け込む習性がある。\r\n大学時代の友人に誘われ、もともと実家の畑を耕していたはずが、いつの間にかWebデザイナー...フロントエンドエンジニアになっていた奇怪な人生。\r\nJavascriptから入門し、とうとうflutterに手を染めた男。だけどAWSも気になっている浮気者。\r\n下のボタンから過去の作例が見れます。',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                      ),
                    ),
                    Container(
                      width:60,
                      height:300,
                      color: Colors.white,
                    ),
                  ]
                ),
                Container(
                  color: Colors.white,
                  child:OutlinedButton(
                    onPressed: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                          return const TaskPage21(); 
                          } 
                        ),
                      );
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
                    child:const Text('portfolio'),
                  ),
                ),
              ],
            ),
          ),
        ]
      ),
    );
  }
}