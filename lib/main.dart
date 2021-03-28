import 'package:flutter/material.dart';
import 'package:gp/anthenticate/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gp/models/users.dart';
import 'package:gp/screens/wrapper.dart';
import 'package:gp/services/auth.dart';
import 'package:provider/provider.dart';

void main()  {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return StreamProvider<Users>.value(
      value: AuthService().user ,

      child: MaterialApp(


        home: Wrapper(),    ),
    );
  }
}
