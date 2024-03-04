// import 'dart:js';


import 'package:dsp/pages/home.dart';
import 'package:dsp/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:dsp/pages/login.dart';

void main() {
  runApp(MaterialApp(initialRoute: '/login', routes: {
    '/login': (context) => login(),
    '/home': (context) => home(),
    '/register': (context) => register()
  }));
}
