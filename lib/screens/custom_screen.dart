import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
import "package:intl/intl.dart";
import '../components/round_button.dart';
import 'dart:async';
import './result_screen.dart';
import '../Data/QuenstionList.dart';


class CustomScreen extends StatefulWidget {
  static const String id='custom_screen';
  @override
  _CustomScreenState createState() => _CustomScreenState();
}

class _CustomScreenState extends State<CustomScreen> {

  @override
  Widget build(BuildContext context) {
    print( QuestionList.questioners);
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom"),
      ),
      body: ListView.separated(
        itemCount: QuestionList.questioners.length,
        itemBuilder: (BuildContext context, int index) {
          return  TextFormField(initialValue:'${QuestionList.questioners[index]}');
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
