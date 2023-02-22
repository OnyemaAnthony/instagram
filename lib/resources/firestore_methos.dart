import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram/models/comment_model.dart';
import 'package:instagram/models/post_Model.dart';
import 'package:instagram/resources/storage_methos.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethos {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
  Future<void> likePost(String postId,String userId,List likes)async{
    try{
      if(likes.contains(userId)){
        await  _firestore.collection('Posts').doc(postId).update({
          'likes':FieldValue.arrayRemove([userId]),
        });
      }else{
        await _firestore.collection('Posts').doc(postId).update({
          'likes':FieldValue.arrayUnion([userId]),
        });
      }
    }catch(e){
      print(e.toString());
    }
  }
  Future<void>postComment(CommentModel comment)async {
    try{
      if(comment.comment!.isNotEmpty){
        String commentId = const Uuid().v1();
        _firestore.collection('Posts').doc(comment.postId).collection('Comments').doc(commentId).set(comment.toMap());
      }
    }catch(e){
      print(e.toString());
    }
  }
}
