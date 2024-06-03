


abstract class RegistrationState{
  const RegistrationState();
}
class RegistrationInitial extends RegistrationState{
  const RegistrationInitial();
}
class RegistrationLoaded extends RegistrationState{
  const RegistrationLoaded();
}
class RegistrationCompleted extends RegistrationState{
  final String  response;
  const RegistrationCompleted({required this.response});
}