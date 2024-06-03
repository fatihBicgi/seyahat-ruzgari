

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obilet_app/data/service/auth_service.dart';

abstract class SplashState{
  const SplashState();
}
class SplashInitial extends SplashState{
  const SplashInitial();
}
class SplashLoading extends SplashState{
  const SplashLoading();
}
class SplashCompleted extends SplashState{
  const SplashCompleted();
}
class SplashCubit extends Cubit<SplashState>{
  SplashCubit():super(SplashInitial());

  var authRepo = AuthService();
  Future<void> checkUserStatus(BuildContext context) async{
    await authRepo.checkUserStatus(context);
  }
}