import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gesture/Data/QuenstionList.dart';
import 'dart:math';
import "package:intl/intl.dart";
import '../components/round_button.dart';
import 'dart:async';
import './result_screen.dart';
import 'package:assets_audio_player/assets_audio_player.dart';


class MainScreen extends StatefulWidget {
  static const String id = 'main_screen';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
//  List questions = ["うんこ", "古事記", "げんまる", "とみおか"];
  List questions = QuestionList.questioners;
  int questionIndex = 0;
  int score = 0;
  int timer = 60;
  Stopwatch s = Stopwatch();
  Timer _timer;
  final _formatter = DateFormat('ss');
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  void shuffle() {
    for (int i = questions.length - 1; i > 0; i--) {
      int r;
      String tmp;
      r = Random().nextInt(questions.length);
      tmp = questions[i];
      questions[i] = questions[r];
      questions[r] = tmp;
      s.start();
    }
  }

  @override
  void initState() {
    super.initState();
    shuffle();
    _timer = Timer.periodic(
        Duration(seconds: 1), // 数値小->高速に時間刻む
    (_t) => setState(() {}));
  }
  @override

  void setState(fn) {
    if(s.elapsed.inSeconds.toInt()==60){
      Navigator.pushNamed(context, ResultScreen.id);
      s.stop();
      s.reset();
    }
    super.setState(fn);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            title: Text(
                "Let's Jesture!!",

            )),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
              width: double.infinity,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                        Container(
                        height: 30,
                        child: Text(
                          "TIME",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                       Container(
                        height: 80,
                        child: (Text(
                          s.elapsed.inSeconds.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 50,
                          ),
                        )),
                      ),

                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      height: 30,
                      child: Text(
                        "SCORE",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      height: 80,
                      child: (Text(
                        score.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 50,
                        ),
                      )),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(
              height: 100,
            ),
            Container(
              height: 200,
              width: double.infinity,
              child: Text(
                questions[questionIndex],
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 70.0
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    height: 150,
                    width: 150,
                    margin: EdgeInsets.all(10),

                  child: RaisedButton(
                    color: Colors.redAccent,
                    child: Text(
                        "スキップ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        if (questionIndex < questions.length - 1) {
                          questionIndex += 1;
                        } else {
                          questionIndex += 0;
                        }
                      });
                    },
                    highlightElevation: 16.0,
                    highlightColor: Colors.red,
                    onHighlightChanged: (value) {},
                    shape: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  width: 150,
                  margin: EdgeInsets.all(10),

                  child: RaisedButton(
                    color: Colors.blueAccent,
                    child: Text(
                      "正解",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        if (questionIndex < questions.length - 1) {
                          questionIndex += 1;
                          score += 10;
                        } else {
                          questionIndex += 0;
                        }
                      });
                    },
                    highlightElevation: 16.0,
                    highlightColor: Colors.blue,
                    onHighlightChanged: (value) {},
                    shape: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              ],
            ),

          ],
        ));
  }
}

