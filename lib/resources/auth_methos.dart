import 'dart:math';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram/models/user_model.dart';
import 'package:instagram/resources/storage_methos.dart';
class AuthMethods{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  
  Future<String> signUpUser(UserModel user,Uint8List file)async{
    String result = 'some error occured';
    try{
      if(user.email!.isNotEmpty ||user.password!.isNotEmpty ||user.bio!.isNotEmpty ||user.userName!.isNotEmpty) {
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(
            email: user.email!, password: user.password!);
        user.id = userCredential.user!.uid;
        user.followings = [];
        user.followers = [];
        user.photoUrl =
        await StorageMethods().uploadImageToStorage('profilePics', file, false);
        await _firestore.collection('Users').doc(user.id).set(user.toMap());
        result = 'Success';
      }

    }  catch(e){
      result = e.toString();
    }
    return result;
  }
}