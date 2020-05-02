import 'package:flutter/material.dart';
import 'package:gesture/screens/main_screen.dart';
import 'package:gesture/screens/result_screen.dart';
import 'package:gesture/screens/start_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        initialRoute: StartScreen.id,
        routes: {
          StartScreen.id:(context)=>StartScreen(),
          MainScreen.id:(context)=>MainScreen(),
          ResultScreen.id:(context)=>ResultScreen(),
        },

    );
  }
}

