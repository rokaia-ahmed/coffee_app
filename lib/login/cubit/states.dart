abstract class LoginStates{}

class InitialLoginState extends LoginStates{}
class LoadingLoginState extends LoginStates{}
class SuccessLoginState extends LoginStates{
 final String id ;
  SuccessLoginState(this.id);
}
class ErrorLoginState extends LoginStates{
  final String error ;
  ErrorLoginState(this.error);
}