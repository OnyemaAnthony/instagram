import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class StorageMethods{
  final FirebaseStorage storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  Future<String> uploadImageToStorage(String childName,Uint8List file,bool isPost)async{
    try{
      Reference reference = storage.ref().child(childName).child(_auth.currentUser!.uid);
       if(isPost){
         String id = const Uuid().v1();
         reference = reference.child(id);
       }
      UploadTask uploadTask = reference.putData(file);
      TaskSnapshot snapshot = await uploadTask;
      return await snapshot.ref.getDownloadURL();
    }catch(e){
      print('the error is ${e.toString()}');
    }
   return '';

  }
}