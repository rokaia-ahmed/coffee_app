abstract class ProductStates{}

class InitialProductState extends ProductStates{}
class LoadingProductState extends ProductStates{}
class SuccessProductState extends ProductStates{}
class ErrorProductState extends ProductStates{
  final String error ;
  ErrorProductState(this.error);
}