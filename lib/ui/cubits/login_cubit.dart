


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obilet_app/data/service/auth_service.dart';
import 'package:obilet_app/ui/cubits/login_state.dart';

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
        print("---------------------------------------------------------------------------");
        emit(LoginError());
      }
    }catch(e){

    }
  }
}