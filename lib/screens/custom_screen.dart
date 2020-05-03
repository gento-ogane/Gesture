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
  List etList=QuestionList.questioners;
  final List tmpList = QuestionList.questioners.map((element)=>element).toList();

  @override
  Widget build(BuildContext context) {

    print( QuestionList.questioners);
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom"),
      ),
      body: Container(
        child: ListView.separated(
          itemCount: QuestionList.questioners.length,
          itemBuilder: (BuildContext context, int index) {
            return  TextFormField(
              initialValue:'${QuestionList.questioners[index]}',
              onChanged: (text){
                QuestionList.questioners[index]=text;
                print(QuestionList.questioners);
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("保存"),
        onPressed: (){
          showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text("注意"),
                content: Text("本当に保存してもよろしいですか？"),
                actions: <Widget>[
                  // ボタン領域
                  FlatButton(
                    child: Text("Cancel"),
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {
                        QuestionList.questioners=tmpList;
                      });
                      print( QuestionList.questioners);
                    },
                  ),
                  FlatButton(
                    child: Text("OK"),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              );
            },
          );

        },
      ),

    );
  }
}

