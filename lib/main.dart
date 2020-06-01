import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:minerva/services/authentication.dart';
import 'package:minerva/pages/root.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget { // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'minerva',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.grey,
    ),
    home: new Root (auth: new Auth()));

  }
}

class Item {
  String key;
  String title;
  String body;
}