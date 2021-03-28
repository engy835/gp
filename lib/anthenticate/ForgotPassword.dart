import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gp/shared/constants.dart';


class ForgotPassword extends StatelessWidget {
TextEditingController editController = TextEditingController();
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Forgot password"),
      backgroundColor:Colors.brown,
    ),
    body: Container(
      margin: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: editController,
            decoration:textInputDecoration.copyWith(


                prefixIcon: Icon(Icons.person),
                hintText: "Enter Email",
               ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0)),
              color: Color(0xFF64272A	),
              onPressed: () {

                resetPassword(context);
              },
              child: Text(
                "Reset password",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    ),
  );
}




 void resetPassword(BuildContext context) async {
  if (editController.text.length == 0 || !editController.text.contains("@")) {
    Fluttertoast.showToast(msg:
    "Enter valid email"
       // , webPosition:
    );
    return;
  }

  await FirebaseAuth.instance
      .sendPasswordResetEmail(email: editController.text);
  Fluttertoast.showToast(
      msg:
      "Reset password link has sent your mail please use it to change the password.");

  Navigator.pop(context);
}
}