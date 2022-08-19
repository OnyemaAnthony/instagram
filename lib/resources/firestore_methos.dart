import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram/resources/storage_methos.dart';

class FirestoreMethos{
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(String )async{
    String result = 'error occured'
    try{
      String photoUrl = await StorageMethods().uploadImageToStorage('Posts', file, isPost)

    }catch(e){

    }
    return result;
  }
}