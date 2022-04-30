abstract class ProductStates{}

class InitialProductState extends ProductStates{}
class LoadingProductState extends ProductStates{}
class SuccessProductState extends ProductStates{}
class ErrorProductState extends ProductStates{
  final String error ;
  ErrorProductState(this.error);
}

class InitialCategoryState extends ProductStates{}
class LoadingCategoryState extends ProductStates{}
class SuccessCategoryState extends ProductStates{}
class ErrorCategoryState extends ProductStates{
  final String error ;
  ErrorCategoryState(this.error);
}
class CreateDatabaseState extends ProductStates{}
class InsertDatabaseState extends ProductStates{}
class GetDatabaseState extends ProductStates{}
class UpdateDatabaseState extends ProductStates{}