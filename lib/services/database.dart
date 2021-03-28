import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gp/models/users.dart';
import 'package:gp/services/auth.dart';

//Future<void> userSetup(String displayName) async {
 // CollectionReference users = FirebaseFirestore.instance.collection('Users');
 // FirebaseAuth auth = FirebaseAuth.instance;
  //String uid = auth.currentUser.uid.toString();
  //users.add({'displayName': displayName, 'uid': uid});
  //return;}
class DatabaseService{
  final String uid;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference TransportCollection = Firestore.instance.collection('Transport');


  Future UpdateUserDate (String name ,String phone) async{
print('uid:  $uid');
print('name:  $name');
    return await TransportCollection.document(uid).setData({
      'name':name,
      'id': uid,
      'Phone Number': phone
    });
  }
  Stream<QuerySnapshot> get name {
    return TransportCollection.snapshots();
  }
}