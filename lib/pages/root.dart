import 'package:flutter/material.dart';
import 'package:minerva/pages/login.dart';
import 'package:minerva/services/authentication.dart';
import 'package:minerva/pages/frontpage.dart';

enum AuthStatus { //status das sessões
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}

class Root extends StatefulWidget {

  Root({this.auth});
  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => new _RootState();
}

class _RootState extends State<Root> {
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  String _userId = "";

  @override
  void initState(){ //verifica qual o status inicial da sessão
    super.initState(); //inicia a sessão como root (superuser)
    widget.auth.getCurrentUser().then((user){ //
        setState(() {
          if (user != null) {
            _userId = user?.uid;
          }
          authStatus = user?.uid == null ? AuthStatus.NOT_LOGGED_IN : AuthStatus.LOGGED_IN;
        });
      });

  }

  void loginCallback() { //define a sessão como logada e atribui uma key à id
    widget.auth.getCurrentUser().then((user){
      setState(() {
        _userId = user.uid.toString();
      });
    });
    setState(() {
      authStatus = AuthStatus.LOGGED_IN;
    });
  }

  void logoutCallback() { //define a sessão como não logada e sobrescreve a id com zeros
    setState(() {
      authStatus = AuthStatus.NOT_LOGGED_IN;
      _userId = "";
    });
  }

  Widget buildWaitingScreen() { //tela de carregamento
    return Scaffold (
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) { //switch para verificar status da sessão
      case AuthStatus.NOT_DETERMINED:
        return buildWaitingScreen();
        break;
      case AuthStatus.NOT_LOGGED_IN:  //manda para a tela de login
        return new Login(
          auth: widget.auth,
          loginCallback: loginCallback,
        );
        break;
      case AuthStatus.LOGGED_IN: //manda para a tela inicial do app se o login for verificado
        if (_userId.length > 0 && _userId != null) {
          return new frontpage(
            userId: _userId,
            auth: widget.auth,
            logoutCallback: logoutCallback,
          );
        } else
          return buildWaitingScreen();
        break;
      default:
        return buildWaitingScreen();
    }
  }
}

