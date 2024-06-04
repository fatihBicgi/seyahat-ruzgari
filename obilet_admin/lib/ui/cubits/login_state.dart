
import 'package:equatable/equatable.dart';

abstract class LoginState{
  const LoginState();
}

class LoginInitial extends LoginState{
  const LoginInitial();
}
class LoginLoaded extends LoginState{
  const LoginLoaded();
}
class LoginCompleted extends LoginState{
  const LoginCompleted();
}
class LoginError extends LoginState{
  const LoginError();
}