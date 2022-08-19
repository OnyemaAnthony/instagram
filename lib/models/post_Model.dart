import 'package:cloud_firestore/cloud_firestore.dart';
class PostModel {
  String? descriptions;
  String? id;
  String? userName;
  String? createdAt;
  String? profileImage;
  List? likes;
  String? userId;
  String? postId;
  String? photoUrl;

  PostModel({
    this.descriptions,
    this.photoUrl,
    this.postId,
    this.userName,
    this.createdAt,
    this.profileImage,
    this.likes,
    this.userId,
  });
  Map<String,dynamic>toMap(){
    Map<String,dynamic> data = <String,dynamic>{};
    data['description']= descriptions;
    data['userName']= userName;
    data['createdAt']= createdAt;
    data['profileImages']= profileImage;
    data['likes']= likes;
    data['photoUrl']= photoUrl;
    data['postId']= postId;
    data['userId'] = userId;
    return data;
  }

  PostModel.fromMap(DocumentSnapshot data){
    id = data.reference.id;
    descriptions = data['descriptions'];
    userName = data['userName'];
    createdAt= data['createdAt'];
    profileImage = data['profileImage'];
    likes = data['likes'];
    photoUrl = data['photoUrl'];
    postId = data['postId'];
    userId = data['userId'];
  }
}
