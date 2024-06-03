


import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:obilet_app/ui/pages/sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../ui/pages/bottom_nav.dart';

class AuthService{
  var firebaseAuth = FirebaseAuth.instance;
  var collectionUser = FirebaseFirestore.instance.collection("Users");
  var auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  Future<bool> login(String email,String password) async{

      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      var userId = auth.currentUser!.uid;
      DocumentSnapshot userDoc = await collectionUser.doc(userId).get();
      if(userDoc["status"] == "freeze"){
        signOut();
        return false;
      }else{
        return true;
      }
  }
  Future<void> checkUserState() async{

  }
  Future<void> registration(String email,String password,String passwordAgain) async{
    try{
      if (password == passwordAgain) {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        var userId = FirebaseAuth.instance.currentUser!.uid;
        var newUser = {
          "mail": email,
          "password": password,
          "user_id": userId,
        };
        await collectionUser.doc(userId).set(newUser);
      }else{
        print("passwords do not match");
      }
    }on FirebaseAuthException catch (e){
      if(e.code == 'weak-password'){
        print('The password provided is too weak');
      }else if(e.code == 'email-already-in-use'){
        print('The account already exists for that email.');
      }
    }
    catch(e){
      print(e);
    }
  }
  Future<void> signOut() async{
    await FirebaseAuth.instance.signOut();
  }
  Future<void> checkUserStatus(BuildContext context) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool seen = (preferences.getBool('seen') ?? false);
    var user = auth.currentUser;
    Future.delayed(Duration(seconds: 3));
    if(seen){
      if(user != null){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavBar(),));
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn(),));
      }
    }else{
      await preferences.setBool('seen', true);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavBar(),));
    }
  }
}