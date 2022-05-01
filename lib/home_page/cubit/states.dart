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
class CreateBagDatabaseState extends ProductStates{}
class InsertBagDatabaseState extends ProductStates{}
class GetBagDatabaseState extends ProductStates{}
class UpdateBagDatabaseState extends ProductStates{}

class CreateFavoriteDatabaseState extends ProductStates{}
class InsertFavoriteDatabaseState extends ProductStates{}
class GetFavoriteDatabaseState extends ProductStates{}
class UpdateFavoriteDatabaseState extends ProductStates{}