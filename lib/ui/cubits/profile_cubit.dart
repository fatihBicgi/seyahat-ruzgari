

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obilet_app/data/entity/profile_model.dart';
import 'package:obilet_app/data/service/auth_service.dart';
import 'package:obilet_app/ui/cubits/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState>{
  ProfileCubit(): super(ProfileInitial());

  var authService = AuthService();
  var collectionUser = FirebaseFirestore.instance.collection("Users");
  Future<void> getUserInfo() async {

    try {
      emit(ProfileInitial());
      emit(ProfileLoading());
      var userDocId = FirebaseAuth.instance.currentUser!.uid;
      print(userDocId);
      Future.delayed(Duration(milliseconds: 1000));
      final querySnapshot = await collectionUser.doc(userDocId).get();
        var data = querySnapshot.data();
        var key = querySnapshot.id;
        var user = ProfileModel.fromJson(data!, key);
        print(user.mail);
        emit(ProfileCompleted(response: user));

    } catch (e) {
      emit(ProfileError(errorMessage: "Error : $e"));
    }
  }
  Future<void> signOut() async{
    await authService.signOut();
  }

}