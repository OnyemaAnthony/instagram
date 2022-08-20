import 'package:cloud_firestore/cloud_firestore.dart';
class UserModel {
  String? userName;
  String? bio;
  String? password;
  String? id;
  String? email;
  String? photoUrl;
  List? followers;
  List? followings;

  UserModel({
    this.userName,
    this.bio,
    this.id,
    this.email,
    this.followers,
    this.followings,
    this.password,
    this.photoUrl,
  });

  Map<String,dynamic>toMap(){
    Map<String,dynamic> user = <String,dynamic>{};
    user['userName']= userName;
    user['bio']= bio;
    user['email'] = email;
    user['photoUrl']= photoUrl;
    user['followers'] = followers;
    user['followings']= followings;
    return user;
  }
  UserModel.fromMap(DocumentSnapshot<Map<String,dynamic>> user){
    id = user.data()!['id'];
    userName = user.data()!['userName'];
    bio = user.data()!['bio'];
    email = user.data()!['email'];
    photoUrl = user.data()!['photoUrl'];
    followers = user.data()!['followers'];
    followings = user.data()!['followings'];
  }
}
