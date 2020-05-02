import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
import '../components/round_button.dart';



class MainScreen extends StatefulWidget {
  static const String id='main_screen';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String  gestureText = "げげげげんまるううう";

  List questions=["うんこ","古事記","げんまる","とみおか"];
  int questionIndex=0;

  void shuffle(){
    for(int i = questions.length -1;i>0;i--){
      //乱数生成を使ってランダムに取り出す値を決める
      int r;
      String tmp;
      r = Random().nextInt(questions.length );
      //取り出した値と箱の外の先頭の値を交換する
      tmp = questions[i];
      questions[i] = questions[r];
      questions[r] = tmp;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Gesture')),
        body: Column(
          children: <Widget>[
            Center(
              child: (
                  Container(
                child: (
                    Text(
                      questions[questionIndex]
                    )
                ),
              )
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RoundIconButton(
                  icon: FontAwesomeIcons.minus,
                  onPressed: () {
                    setState(() {

                        questionIndex+=1;
                    });
                  },
                ),
              ],

            )
          ],
        ));
  }
}


