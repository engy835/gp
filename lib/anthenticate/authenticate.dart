import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gp/anthenticate/Register.dart';
import 'package:gp/anthenticate/sign_in.dart';
import 'package:gp/models/users.dart';
import 'package:gp/screens/home.dart';
import 'package:provider/provider.dart';
class Authenticate extends StatefulWidget {
  @override
   _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true ;
  void toggleView(){
    setState(() =>showSignIn = !showSignIn
    );
  }

  @override
  Widget build(BuildContext context) {
   if(showSignIn){
     return SignIn(toggleView: toggleView);
   }else{
     return Register( toggleView: toggleView );
   }
  }
}
