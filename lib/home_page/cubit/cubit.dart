import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop/home_page/cubit/states.dart';
import 'package:coffee_shop/model/category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/product_model.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit(ProductStates initialState) : super(initialState);

  static ProductCubit get(context) => BlocProvider.of(context);

  FirebaseFirestore db = FirebaseFirestore.instance;

  late CategoryModel categoryModel;

  //List<CategoryModel> category = [];

  // Future<List<CategoryModel>> getCategory()async{
  //   emit(LoadingCategoryState());
  //   var response = db.collection('categories').doc('2');
  //   await response.get().then((value) {
  //     List data = value.get('data');
  //    // print(data);
  //     data.forEach((element) {
  //       category.add(CategoryModel.fromJson(element));
  //       categoryModel = CategoryModel.fromJson(element);
  //     });
  //     emit(SuccessCategoryState());
  //   }).catchError((error){
  //     emit(ErrorCategoryState(error.toString()));
  //   });
  //   return category ;
  // }
  List<ProductModel> products = [];
  List<ProductModel> special = [];
  Map<String, List<ProductModel>> category = {};
  Future<List<ProductModel>> getProduct() async {
    emit(LoadingProductState());
    var response = db.collection('Product').doc('1');
    await response.get().then((value) {
      List data = value.get('data');
      // print(data);
      data.forEach((element) {
        ProductModel model = ProductModel.fromJson(element);
        if (model.special != true) {
          if (category[model.categoryId] == null)
            category[model.categoryId] = [];
          category[model.categoryId]!.add(model);
          products.add(model);
        } else {
          special.add(model);
        }
        // print('data : '+products.toString());
        print(products);
        emit(SuccessProductState());
      });
    }).catchError((error) {
      print(error);
      emit(ErrorProductState(error.toString()));
    });
    return products;
  }
}

/*  var response = await db.collection('Product').doc('1').get();
    List data = response.get('data');
    data.forEach((element) {
      products.add(ProductModel.fromJson(data[element]));
    });   */
