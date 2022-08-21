import 'package:cloud_firestore/cloud_firestore.dart';
class CommentModel {
  String? id;
  String? comment;
  String? postId;
  String? userId;
  String? name;
  String? profilePicture;
  String? createdAt;
  String? updatedAt;

  CommentModel({
    this.comment,
    this.postId,
    this.userId,
    this.name,
    this.profilePicture,
  });

  Map<String,dynamic>toMap(){
    Map<String,dynamic> data = <String,dynamic>{};
    data['comment'] = comment;
    data['postId']= postId;
    data['userId']= userId;
    data['name']= name;
    data['profilePicture']= profilePicture;
    data['createdAt']= createdAt;
    data['updatedAt']= updatedAt;
    return data;
  }

  CommentModel.fromMap(DocumentSnapshot<Map<String,dynamic>> commentDoc){
    id = commentDoc.id;
    comment = commentDoc.data()!['comment'];
    postId = commentDoc.data()!['postId'];
    userId = commentDoc.data()!['userId'];
    name = commentDoc.data()!['name'];
    profilePicture = commentDoc.data()!['profilePicture'];
    createdAt = commentDoc.data()!['createdAt'];
    updatedAt = commentDoc.data()!['updatedAt'];
  }
}
