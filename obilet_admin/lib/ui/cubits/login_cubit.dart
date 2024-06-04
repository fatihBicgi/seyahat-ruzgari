





import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obilet_admin/data/auth_service.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit():super(LoginInitial());


  var authService = AuthService();
  Future<void> login(String mail,String password) async{
    try{
      emit(LoginLoaded());
      var a = await authService.login(mail, password);
      if(a == true){
        emit(LoginCompleted());
      }else{
        emit(LoginError());
      }
    }catch(e){

    }
  }

}