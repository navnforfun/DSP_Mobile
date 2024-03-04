import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dsp/store/user.dart';
import 'package:dsp/store/constant.dart' as app;

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  late SharedPreferences prefs;

  Future<void> getData() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Xin chao ' + user.userName,
          style: TextStyle(color: app.yellow_500,fontWeight: FontWeight.bold) ,
        ),
        backgroundColor: app.red_600,
      ),
      body: Column(children: [
        Text('Ung dung chia se tai lieu'),
      ]),
    );
  }
}
