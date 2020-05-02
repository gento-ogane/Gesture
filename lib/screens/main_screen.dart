import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
import "package:intl/intl.dart";
import '../components/round_button.dart';
import 'dart:async';
import './result_screen.dart';


class MainScreen extends StatefulWidget {
  static const String id = 'main_screen';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List questions = ["うんこ", "古事記", "げんまる", "とみおか"];
  int questionIndex = 0;
  int score = 0;
  int timer = 60;
  Stopwatch s = Stopwatch();
  Timer _timer;
  final _formatter = DateFormat('ss');

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
    if(s.elapsed.inSeconds.toInt()==10){
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
        appBar: AppBar(title: Text('Gesture!!')),
        body: Column(
          children: <Widget>[
            Container(
              child: (
                  Text(
                s.elapsed.inSeconds.toString(),
              )),
            ),
            Center(
              child: (Container(
                child: (
                    Text(
                    questions[questionIndex],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50.0
                      ),
                    )),
              )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RoundIconButton(
                  icon: FontAwesomeIcons.arrowRight,
                  onPressed: () {
                    setState(() {
                      if (questionIndex < questions.length - 1) {
                        questionIndex += 1;
                      } else {
                        questionIndex += 0;
                      }
                    });
                  },
                ),
                RoundIconButton(
                  icon: FontAwesomeIcons.circle,
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
                ),
              ],
            ),
            Container(
              child: (Text(
                score.toString(),
              )),
            )
          ],
        ));
  }
}
