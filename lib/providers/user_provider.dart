
import 'package:flutter/material.dart';
import 'package:instagram/models/user_model.dart';
import 'package:instagram/resources/auth_methos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProvider with ChangeNotifier{
  UserModel? _user;
  AuthMethods authMethods = AuthMethods();

  UserModel get getUser => _user!;
  Future<void> refreshUser()async{

    UserModel user = await authMethods.getUserData();
    _user = user;
    notifyListeners();
  }
}