import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minerva/services/routes.dart';
import 'package:minerva/services/authentication.dart';



class Frontpage extends StatefulWidget {

  Frontpage({Key key, this.auth, this.userId, this.logoutCallback}): super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  _FrontpageState createState() => _FrontpageState();
}



class _FrontpageState extends State<Frontpage> {

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
      ),
      drawer: drawerMenu(),


      //backgroundColor: prefix0.Color.fromARGB(255, 24, 38, 54),
    );
  }

  Widget drawerMenu() {
    return new Drawer (
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[

          _createDrawerItem(
            icon: Icons.person,
            text: 'Perfil',
            onTap: () => Navigator.pushReplacementNamed(context, Routes.userpage)
          ),

          _createDrawerItem(
              icon: Icons.settings,
              text: 'Configurações',
              onTap: () => Navigator.pushReplacementNamed(context, Routes.config)
          ),

          _createDrawerItem(
              icon: Icons.notifications,
              text: 'Notificações',
              onTap: () => Navigator.pushReplacementNamed(context, Routes.notifications)
          ),

          _createDrawerItem(
              icon: Icons.lock,
              text: 'Segurança',
              onTap: () => Navigator.pushReplacementNamed(context, Routes.security)
          ),

          _createDrawerItem(
              icon: Icons.help,
              text: 'Ajuda',
              onTap: () => Navigator.pushReplacementNamed(context, Routes.help)
          ),

          Divider(),

          new FlatButton(onPressed: signOut, child: new Text ('Logout'))

        ],

      ),

    );
  }
/*
  Widget showWeather() {

  }

  Widget reportStorm() {

  }
*/
  Widget _createDrawerItem({IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile (
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );

  }


}