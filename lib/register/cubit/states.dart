abstract class RegisterStates{}

class InitialRegisterState extends RegisterStates{}
class LoadingRegisterState extends RegisterStates{}
class SuccessRegisterState extends RegisterStates{
 final String id;
  SuccessRegisterState(this.id);
}
class ErrorRegisterState extends RegisterStates{
  final String error ;
  ErrorRegisterState(this.error);
}

class SuccessCreateUserState extends RegisterStates{}
class ErrorCreateUserState extends RegisterStates{
  final String error ;
  ErrorCreateUserState(this.error);
}
