import 'package:flutter/material.dart';
import 'package:gp/services/auth.dart';
import 'package:gp/shared/constants.dart';
import 'package:gp/services/database.dart';
class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  final buttonlogin=FlatButton();
 // TextEditingController _usernameController = TextEditingController();
  //text filed state
  String email = '';
  String password = '';
  String error ='';
  String name='';
  String phone='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      /*  appBar: AppBar(
          backgroundColor: Colors.indigo,
          elevation: 0.0,
          title:Text('sign up') ,
          actions: <Widget>[
            FlatButton.icon(onPressed:(){ widget.toggleView();} , icon:Icon(Icons.person) , label: Text('Sign In'))
          ],

        ),*/
        body:  Container(
        padding: EdgeInsets.symmetric(vertical:20.0 ,horizontal:50.0 ),
    child: Form(
      key:_formkey,
    child:Column(
    children: <Widget>[
      SizedBox(height: 15,),



      Text('SIGN UP',style: TextStyle(height: 5 ,color:Color(0xFF64272A),fontSize:25,fontWeight:FontWeight.bold


      ),  )



      ,SizedBox(height: 15.0),
      TextFormField(

//        controller: _usernameController,

          decoration: InputDecoration(hintText:'Name:'),
        onChanged:(val) async{
          setState(() => name = val);
       }

    ),

    SizedBox( height: 15.0,)
    , TextFormField(
        decoration: InputDecoration(hintText:'Email:'),
        validator:(val) =>val.isEmpty ?'Enter an email':null ,
    onChanged: (val){
    setState(() => email = val);
    },
    ),
      SizedBox(height: 15.0),
      TextFormField(

          decoration: InputDecoration(hintText:'phone Number:'),
          onChanged:(val) async{
            setState(() => phone = val);
          }

      ),
    SizedBox( height: 15.0,),
    TextFormField(
        decoration: InputDecoration(hintText: 'password:'),
      validator:(val) =>val.length < 6 ?'Enter a password 6+ chars long':null,
    obscureText:true ,
    onChanged:(val){
    setState(() => password = val);
    },

    )
      ,SizedBox( height: 15.0,)
        //Confirm Password
        ,TextFormField(
        decoration: InputDecoration(hintText: 'Confirm Password:'),
          obscureText: true,
          validator: (value)
          {
            if(value.isEmpty || value != password)
            {
              return 'invalid password';
            }
            return null;
          },
          onSaved: (value)
          {

          },
        )
    ,SizedBox( height: 20.0,),
    RaisedButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80.0)),
      color:Color(0xFF64272A	),
      child:Text('Register'
        , style: TextStyle(color: Colors.white,fontSize: 16), )
    ,onPressed:()  async {


    if(_formkey.currentState.validate()){
      dynamic result =await _auth.registerWithEmailAndPassword(email, password ,name , phone);
//      var username = await DatabaseService().UpdateUserDate(name);
          if( result == null){
            setState(() =>error ='please supply  a valid email');

          }// مش نعمل else علشان هو اوتامتك هيعمل register
      // علشان عندنا  streaبتشوف كل التغيرات ف لما الuser يعمل registerهيسمع ف الstream ف خلاص ال هيبقه موجود
     // print(email);
    //  print(password);
    }

    } ,
    ),
      SizedBox(height: 5.0),
      Text(error
      , style: TextStyle(color:Colors.red,fontSize: 14.0
        ),
      )


      , FlatButton(
          child: Text('Log In', style: TextStyle(color: Colors.grey, fontSize: 20),),
          onPressed:() {widget.toggleView();}
      ),


    ],
    ) ,
    )

        ) ,
    );
  }
}