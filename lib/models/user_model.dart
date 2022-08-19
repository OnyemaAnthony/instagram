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
  UserModel.fromMap(dynamic user){
    id = user['id'];
    userName = user['userName'];
    bio = user['bio'];
    email = user['email'];
    photoUrl = user['photoUrl'];
    followers = user['followers'];
    followings = user['followings'];
  }
}
