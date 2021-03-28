import 'package:flutter/material.dart';
import 'package:gp/services/auth.dart';
import 'package:gp/services/database.dart';
class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.brown[50] ,

      appBar: AppBar(
        backgroundColor: Colors.brown.shade400,
        elevation: 0.0,
        title:Text('my project') ,
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () async { await _auth.signOut() ;}, icon:Icon(Icons.person) , label:Text('log out'))
        ],

      ),
    );
  }
}
