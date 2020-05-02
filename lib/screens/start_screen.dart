import 'package:flutter/material.dart';
import '../components/round_button.dart';
import './main_screen.dart';
import './result_screen.dart';
import './custom_screen.dart';


class StartScreen extends StatefulWidget {
  static const String id='start_screen';
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (
          AppBar(title: Text('Start'))
      ),
      body: (
      Container(
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, CustomScreen.id);
          }

        ),

      )

      ),
    );
  }
}

