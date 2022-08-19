import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram/models/post_Model.dart';
import 'package:instagram/resources/storage_methos.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethos {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(PostModel post, Uint8List file) async {
    String result = 'error occured';
    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage('Posts', file, true);
      String postId = const Uuid().v1();

      post.createdAt = DateTime.now().toString();
       post.photoUrl = photoUrl;
      post.postId = postId;
      post.likes = [];
      _firestore.collection('Posts').doc(postId).set(post.toMap());
      result = "Success";
    } catch (e) {

      result = "Error";
    }
    return result;
  }
}
