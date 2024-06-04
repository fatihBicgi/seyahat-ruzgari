

import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obilet_app/data/service/auth_service.dart';


class MyProfileCubit extends Cubit<void>{
  MyProfileCubit():super(0);

  final authService = AuthService();
  final collectionUser = FirebaseFirestore.instance.collection("Users");

  Future<void> makeStatusFreeze() async {
    try {
      var userId = FirebaseAuth.instance.currentUser!.uid;
      var userRef = collectionUser.doc(userId);
      await userRef.update({"status": "freeze"});
      signOut();
    } catch (e) {
      print(e);
    }
  }
  Future<void> updateUserInfo(String updatedName,String updatedSurname,String updatedDate,String updatedPhone,String identityId) async{
    var currentUser = FirebaseAuth.instance.currentUser!.uid;
    var updateUserInfos = HashMap<String,dynamic>();
    updateUserInfos["name"] = updatedName;
    updateUserInfos["surname"] = updatedSurname;
    updateUserInfos["date"] = updatedDate;
    updateUserInfos["phone"] = updatedPhone;
    updateUserInfos["identityId"] = identityId;
    collectionUser.doc(currentUser).update(updateUserInfos);
  }

  Future<void> signOut() async{
    await authService.signOut();
  }
}