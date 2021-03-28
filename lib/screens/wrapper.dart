import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gp/anthenticate/authenticate.dart';
import 'package:gp/anthenticate/sign_in.dart';
import 'package:gp/models/users.dart';
import 'package:gp/screens/home.dart';
import 'package:provider/provider.dart';
class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context);
    if(user==null){
      return Authenticate();
    }
    else{
      return Home();
    }

  }
}
