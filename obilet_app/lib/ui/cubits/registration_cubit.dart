import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obilet_app/data/entity/registration_state.dart';
import 'package:obilet_app/data/service/auth_service.dart';

class RegistrationCubit extends Cubit<RegistrationState> {

  RegistrationCubit() : super(RegistrationInitial());


  var authService = AuthService();


  Future<void> registration(
      String mail, String password, String passwordAgain) async {
    emit(RegistrationInitial());
    emit(RegistrationLoaded());
    try{
      if(password.length > 6){
        await authService.registration(mail, password, passwordAgain);
        Future.delayed(Duration(milliseconds: 1000));
        emit(RegistrationCompleted(response: "success"));
      }else{
        print("Error");
      }

    }catch(e){
      print(e);
    }

  }
}
