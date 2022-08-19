class PostModel {
  String? descriptions;
  String? id;
  String? userName;
  String? createdAt;
  List? profileImages;
  List? likes;
  String? postId;
  String? photoUrl;

  PostModel({
    this.descriptions,
    this.photoUrl,
    this.postId,
    this.userName,
    this.createdAt,
    this.profileImages,
    this.likes,
  });
  Map<String,dynamic>toMap(){
    Map<String,dynamic> data = <String,dynamic>{};
    data['descriptions']= descriptions;
    data['userName']= userName;
    data['createdAt']= createdAt;
    data['profileImages']= profileImages;
    data['likes']= likes;
    data['photoUrl']= photoUrl;
    data['postId']= postId;
    return data;
  }

  PostModel.fromMap(dynamic data){
    id = data['id'];
    descriptions = data['descriptions'];
    userName = data['userName'];
    createdAt= data['createdAt'];
    profileImages = data['profileImages'];
    likes = data['likes'];
    photoUrl = data['photoUrl'];
    postId = data['postId'];
  }
}
