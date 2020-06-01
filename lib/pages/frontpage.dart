import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:minerva/services/authentication.dart';


class frontpage extends StatefulWidget {

  frontpage({Key key, this.auth, this.userId, this.logoutCallback}): super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  _frontpageState createState() => _frontpageState();
}

class _frontpageState extends State<frontpage> {

  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState> ();

  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text('Clima de Minerva'),
        actions: <Widget>[
          new FlatButton(onPressed: signOut, child: new Text ('Logout'))
        ],
      ),
    );
  }

  Widget drawerMenu() {

  }

  Widget showWeather() {

  }

  Widget reportStorm() {

  }



}