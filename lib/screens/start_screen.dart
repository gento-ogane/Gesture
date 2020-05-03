import 'package:flutter/material.dart';
import '../components/round_button.dart';
import './main_screen.dart';
import './result_screen.dart';
import './custom_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class StartScreen extends StatefulWidget {
  static const String id='start_screen';
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 400.0,
              child: TextLiquidFill(
                text: 'じぇすちゃーゲーム',
                waveColor: Colors.blueAccent,
                boxBackgroundColor: Colors.blue[50],
                textStyle: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "guzuri_1nensei.ttf",
                ),
                boxHeight:100,
              ),
            ),
            SizedBox(
              height:150.0,
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: RaisedButton(
                child: Text(
                  "スタート",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "guzuri_1nensei.ttf",
                    fontSize: 20,
                  ),
                ),
                color: Colors.white,
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, MainScreen.id);
                },
              ),
            ),
            SizedBox(
              height:30.0,
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: RaisedButton(
                child: Text(
                  "遊び方",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "guzuri_1nensei.ttf",
                    fontSize: 20,
                  ),
                ),
                color: Colors.white,
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, MainScreen.id);
                },
              ),
            ),
            SizedBox(
              height:30.0,
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: RaisedButton(
                child: Text(
                  "お題カスタム",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "guzuri_1nensei.ttf",
                    fontSize: 20,
                  ),
                ),
                color: Colors.white,
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, CustomScreen.id);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


