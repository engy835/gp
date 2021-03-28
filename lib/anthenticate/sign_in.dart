import 'package:firebase_core/firebase_core.dart';
import 'package:gp/anthenticate/ForgotPassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gp/services/auth.dart';
import 'package:gp/shared/constants.dart';
import 'package:gp/shared/loading.dart';
class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn ({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final buttonCreateAccount=FlatButton();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;
  //text filed state
  String email = '';
  String password = '';
  String error ='';
  @override
  Widget build(BuildContext context) {
   return loading ? Loading(): Scaffold(
     backgroundColor: Colors.white,
   /*  appBar: AppBar(
       backgroundColor: Colors.brown.shade400,
       elevation: 0.0,
       title:Text('Sign in') ,
       actions: <Widget>[
         FlatButton.icon(onPressed:(){widget.toggleView();} , icon:Icon(Icons.person) , label: Text('Register'))
       ],

     ),*/
     body:
     Container(

       padding: EdgeInsets.symmetric(vertical:10.0 ,horizontal:20.0 ),


       child: Form(

         key:_formkey,
         child:Column(



           children: <Widget>[

             SizedBox(height: 20,),



            Text('USER LOGIN',style: TextStyle(height: 10 ,color:Color(0xFF64272A),fontSize:25,fontWeight:FontWeight.bold


       ),  )
            /* Text(
               decoration: InputDecoration(
                 fillColor:Color(0xFF64272A	),
                 enabledBorder: OutlineInputBorder(
                   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                   borderSide: BorderSide.none,
                 ),

                 labelText: 'USER LOGIN',
               ),*/


            // )

             ,SizedBox( height: 20.0,),

            TextFormField(

               decoration: textInputDecoration.copyWith(hintText: 'Email or Username',prefixIcon: Icon(Icons.person)),


               validator:(val) =>val.isEmpty ?'Enter an email':null ,

               onChanged: (val){
                 setState(() => email = val);
               },
             ),
             SizedBox( height: 20.0,),
             TextFormField(
                 decoration: textInputDecoration.copyWith(hintText: 'password',prefixIcon: Icon(Icons.lock)),
               validator:(val) =>val.length < 6 ?'Enter a password 6+ chars long':null,
               obscureText:true ,
                 onChanged:(val){
                   setState(() => password = val);
                 },
             )

             ,Row(
               children: <Widget>[

                FlatButton(
                     child: Text('Forgot Password?', style: TextStyle(color: Colors.grey, fontSize: 15),),
                     onPressed:() => Navigator.of(context).push(
                         MaterialPageRoute(
                         builder: (_) => ForgotPassword()))


                 ),
               ],
             )


             ,SizedBox( height: 20.0,),
             RaisedButton(
                 shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(80.0)),
               color:Color(0xFF64272A	),
               child:Text('LOGIN'
               , style: TextStyle(color: Colors.white,fontSize: 16), )
               ,onPressed:()  async {
    if(_formkey.currentState.validate()){
       setState(() =>loading =true

       );
      dynamic result =await _auth.signInWithEmailAndPassword(email, password);

     if( result == null){
     setState(() =>error ='Could Not Sign In With This Email');
     loading =false;
    }}}// مش نعمل else علشان هو اوتامتك هيعمل register
    // علشان عندنا  streaبتشوف كل التغيرات ف لما الuser يعمل registerهيسمع ف الstream ف خلاص ال هيبقه موجود

  //  print(email);
          //       print(password);
              ,
             ),
            FlatButton(
       child: Text('Create Account', style: TextStyle(color: Colors.grey, fontSize: 16),),
       onPressed:() {widget.toggleView();}
   ),
           SizedBox(height: 12.0),
         Text(error
           , style: TextStyle(color:Colors.red,fontSize: 14.0
           ),
         )
           ],
         ) ,
       )



     ) ,

   );
  }
}
