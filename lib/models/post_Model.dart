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

  PostModel.fromMap(DocumentSnapshot<Map<String,dynamic>> data){
    id = data.id;
    descriptions = data.data()!['description'];
    userName = data.data()!['userName'];
    createdAt= data.data()!['createdAt'];
    profileImage = data.data()!['profileImages'];
    likes = data.data()!['likes'];
    photoUrl = data.data()!['photoUrl'];
    postId = data.data()!['postId'];
    userId = data.data()!['userId'];
  }
}
