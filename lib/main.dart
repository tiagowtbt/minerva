//import 'dart:ui';

import 'package:minerva/pages/userpage.dart';
import 'package:minerva/pages/config.dart';
import 'package:minerva/pages/help.dart';
import 'package:minerva/pages/notifications.dart';
import 'package:minerva/pages/security.dart';

import 'package:flutter/material.dart';
import 'package:minerva/services/authentication.dart';
import 'package:minerva/pages/root.dart';

import 'package:minerva/services/routes.dart';

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
    home: new Root (auth: new Auth()),
    routes: {
      Routes.userpage: (context) => Userpage(),
      Routes.config: (context) => Config(),
      Routes.notifications: (context) => Notifications(),
      Routes.security: (context) => Security(),
      Routes.help: (context) => Help(),
    },
    );

  }
}

class Item {
  String key;
  String title;
  String body;
}